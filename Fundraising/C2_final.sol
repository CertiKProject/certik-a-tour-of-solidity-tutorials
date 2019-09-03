pragma solidity ^0.5.10;

contract FundRaising {

  address owner;
  uint public goal;
  uint public endTime;
  uint public totalContribution = 0;

  mapping(address=>uint) donations;
  function add() payable public {
    donations[msg.sender] += msg.value;
    totalContribution += msg.value;
  }
}
