pragma solidity ^0.5.10;

contract Deletion {
  uint256 public d  = 43;
  uint256 public d1 = 51 ;
  uint256 public d2 = 23 ;
  uint256 public d3 = 1234;

  function DoStuff() public returns(uint256) {
    d = 123;
    d1 = 1234;
    d2 = 1235;
    d3 = 1236;

    uint result = d*d1-d2*d3;
    //start here


    return result;
  }
}

