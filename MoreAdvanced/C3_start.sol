pragma solidity ^0.5.11;

contract TestEncode {
  string s = "asdfsdf";
  function addSuf(string memory a) public returns(string memory) {
    string memory r = string(abi.encodePacked(a, s));
    return r;
  }
  
  function compareStr(string memory a, string memory b) public returns(bool) {
  }
  
  function compareStrWithoutHash(string memory a, string memory b) public returns(bool) {
  }
  
  function cannotCallTwice(uint a) public {
  }
}