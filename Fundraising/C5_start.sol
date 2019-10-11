pragma solidity ^0.5.10;

contract FundRaising {

  address payable owner;
  uint public goal;
  uint public endTime;

  mapping(address=>uint) donations;
  address payable[] donors; 

  constructor(uint _goal, uint _timelimit) public {
    owner = msg.sender;
    goal = _goal;
    endTime = block.number + _timelimit;
  }

  function add() public payable {
    if(donations[msg.sender] == 0) {
      donors.push(msg.sender);
    }
    donations[msg.sender] += msg.value;
  }

  function withdrawOwner() public {
    require(address(this).balance >= goal, "Fundraising not closed yet");
    require(msg.sender == owner, "You must be the owner");
    owner.transfer(address(this).balance);
  }
  
  //WRONG!! Don't do this!!
  function withdraw() public {
    for(uint i = 0; i < donors.length; i++) {
      (donors[i]).transfer(donations[donors[i]]);
      donations[donors[i]] = 0;
    }
  } 
}
