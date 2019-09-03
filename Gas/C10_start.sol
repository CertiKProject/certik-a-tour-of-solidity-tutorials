pragma solidity ^0.5.10;

contract testSuicide {
  string s = "dd";
  string a;
  constructor() public {
    a = "ee";
  }
  function finish() public {
    s = "1111111111";
    a = "222222222222";
    //add selfdestruct here.
  }
}

