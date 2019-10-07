pragma solidity ^0.5.10;

contract FundRaising {

  mapping(address=>uint) donations;

  // add constructor function here

  function add() public payable {
    donations[msg.sender] += msg.value;
  }

  // add withdraw function here
}
