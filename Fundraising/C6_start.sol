pragma solidity ^0.5.10;

contract FundRaising {

  address payable owner;
  uint public goal;
  uint public endTime;
  uint public totalContribution = 0;

  mapping(address=>uint) donations;

  constructor(uint _goal, uint _timelimit) public {
    owner = msg.sender;
    goal = _goal;
    endTime = block.number + _timelimit;
  }

  function add() public payable {
    donations[msg.sender] += msg.value;
    totalContribution += msg.value;
  }

  function withdrawOwner() public {
    require(totalContribution >= goal, "Fundraising not closed yet");
    require(msg.sender == owner, "You must be the owner");
    owner.transfer(address(this).balance);
  }

  function withdraw() public {
    require(block.number > endTime, "Fundraising not closed");
    require(totalContribution < goal, "Cannot withdraw when fundraising was successful");
    uint amount = donations[msg.sender];
    totalContribution -= amount;
    donations[msg.sender] = 0;
    address(msg.sender).transfer(amount);
  }

}
