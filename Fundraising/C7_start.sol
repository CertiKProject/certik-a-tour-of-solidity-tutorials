pragma solidity ^0.5.10;

contract FundRaising {

  address payable owner;
  uint public goal;
  uint public endTime;
  address public topDonor;

  mapping(address=>uint) donations;

  constructor(uint _goal, uint _timelimit) public {
    owner = msg.sender;
    goal = _goal;
    endTime = block.number + _timelimit;
  }

  function add() public payable {
    donations[msg.sender] += msg.value;
    if(donations[msg.sender] > donations[topDonor]) {
      topDonor = msg.sender;
    }
  }

  function withdrawOwner() public {
    require(address(this).balance >= goal, "Fundraising not closed yet");
    require(msg.sender == owner, "You must be the owner");
    owner.transfer(address(this).balance);
  }

  function withdraw() public {
    require(address(this).balance < goal, "Fundraising campaign was successful");
    require(now > endTime, "Fundraising campaign is still ongoing");
    msg.sender.transfer(donations[msg.sender]);
    donations[msg.sender] = 0;
  }
  
  function percentageComplete() public view returns (uint) {
    require(goal != 0, "goal is 0, cannot divide by 0");
    return 100 * (address(this).balance / goal);
  }
}
