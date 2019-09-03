pragma solidity ^0.5.10;

contract FundRaising {
  uint public goal;
  uint public endTime;
  uint public totalContribution = 0;
  address payable owner;
  bool open = true;

  mapping(address=>uint) donations;

  constructor(uint _goal, uint _timelimit) public {
    owner = msg.sender;
    goal = _goal;
    endTime = block.number + _timelimit;
  }

  function add() public payable {
    require(open, "the campaign is finished");
    require(msg.value > 0, "You need to send some ether");
    donations[msg.sender] += msg.value;
    totalContribution += msg.value;
  }

  function withdrawOwner() public {
    require(totalContribution >= goal, "Fundraising not closed yet");
    require(msg.sender == owner, "You must be the owner");

    open=false;
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

  function monitor() public view returns(uint) {
    require(goal != 0, "goal is 0, cannot divide by 0");
    return totalContribution * 100 / goal;
  }
}
