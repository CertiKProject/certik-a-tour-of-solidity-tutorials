pragma solidity ^0.5.10;

contract FundRaising {

  address payable owner;
  uint public goal;
  uint public endTime;
  uint public totalContribution = 0;

  mapping(address=>uint) donations;

  // add constructor function here

  function add() public payable {
    donations[msg.sender] += msg.value;
    totalContribution += msg.value;
  }

  // add withdraw function here
}
