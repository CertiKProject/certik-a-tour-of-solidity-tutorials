pragma solidity ^0.5.10;

contract Marker {
  uint256 a;
  string b;
  bytes32 c;


  function getap() public returns(uint256) {
    return a;
  }
  function getbp() public returns(string memory) {
    return b;
  }
  function getcp() public returns(bytes32) {
    return c;
  }
}

