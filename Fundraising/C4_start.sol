pragma solidity ^0.5.10;

contract FundRaising {

  address payable owner;
  uint public goal;
  uint public endTime;
  uint public totalContribution = 0;

  mapping(address=>uint) donations;

  constructor() public {
    owner = msg.sender;
  }

  function add() public payable {
    donations[msg.sender] += msg.value;
    totalContribution += msg.value;
  }

  function withdrawOwner() public {
    require(msg.sender == owner, "You must be the owner");
    owner.transfer(address(this).balance);
  }
}
