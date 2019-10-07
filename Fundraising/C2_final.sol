pragma solidity ^0.5.10;

contract FundRaising {

  mapping(address=>uint) donations;
  
  function add() payable public {
    donations[msg.sender] += msg.value;
  }
}
