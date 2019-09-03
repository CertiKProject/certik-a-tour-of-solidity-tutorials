pragma solidity ^0.5.11;

contract TestEncode {
  string s = "asdfsdf";
  mapping (bytes32=>bool) public  called;
  
  function addSuf(string memory a) public returns(string memory) {
    string memory r = string(abi.encodePacked(a, s));
    return r;
  }
  
  function compareStr(string memory a, string memory b) public returns(bool) {
    return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
  }
  
  function compareStr2(string memory a, string memory b) public returns(bool) {
    bytes memory ab = bytes(a);
    bytes memory bb = bytes(b);
    if (ab.length != bb.length) {
      return false;
    }
    for (uint i; i < ab.length; i++) {
      if (ab[i] != bb[i]){
        return false;
      }
    }
    return true;
  }
  
  function cannotCallTwice(uint a) public {
    require(!called[keccak256(abi.encodePacked(msg.sender,a))]);
    called[keccak256(abi.encodePacked(msg.sender,a))] = true;
  }
}