pragma solidity ^0.5.10;

contract StringTest {
  string a = "fsdf€bÁ";
  bytes b = "fsdf€bÁ";

  function gets() public view returns(string memory) {
    return a;
  }

  function getb() public view returns(bytes memory) {
    return b;
  }

  function getl() public view returns(uint) {
    return bytes(a).length;
  }

  function getlb() public view returns(uint) {
    return b.length;
  }
}
