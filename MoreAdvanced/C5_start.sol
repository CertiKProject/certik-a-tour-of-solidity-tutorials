pragma solidity ^0.5.11;

contract Caller {
  uint public x = 0;
  function callTest() public {
    //make this trigger the fallback function
  }
  function() external { x = 1; }
}

