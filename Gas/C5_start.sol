pragma solidity ^0.5.10;

contract StringTest {
  string a = "fsdf€bÁ";
  bytes b = "fsdf€bÁ";

  function gets() public returns(string memory) {
    return a;
  }

  function getb() public returns(bytes memory) {
    return b;
  }

  function getl() public returns(uint) {
    return bytes(a).length;
  }

  function getlb() public returns(uint) {
    return b.length;
  }
}
