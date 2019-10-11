pragma solidity ^0.5.10;

contract UintTest {
  uint256 a;
  uint8 b;

  function geta() public returns(uint256) {
    return a;
  }
  function getb() public returns(uint8) {
    return b;
  }

  function seta(uint256 i) public {
    a = i;
  }

  function setb(uint8 i) public {
    b = i;
  }
}
