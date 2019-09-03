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

  function geta() public view returns(uint256) {
    return a;
  }
  function getb() public view returns(string memory) {
    return b;
  }
  function getc() public view returns(bytes32) {
    return c;
  }

  function add() public pure returns(uint256) {
    return 123+123;
  }
  function add2() public returns(uint256) {
    return 123+123;
  }

}
