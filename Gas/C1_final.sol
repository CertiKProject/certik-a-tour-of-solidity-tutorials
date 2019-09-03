pragma solidity ^0.5.10;

contract StringTest {
  string a;

  function gets() public view returns(string memory) {
    return a;
  }

  function getbyte() public view returns(bytes memory) {
    bytes memory r = bytes(a);
    return r;
  }
}
