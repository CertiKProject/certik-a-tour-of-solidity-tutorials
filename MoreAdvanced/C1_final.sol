pragma solidity ^0.5.10;

contract TestBit {

  function q1() public pure {
    uint r = 314;
    
    uint a = 123;
    uint b = 321;
    require(a ^ b == r, "error!"); //fill in here
  }
  
  function q2() public pure {
    int r = -2;
    
    int a = 12;
    int b = 3;
    int c = 2;
    int d = 4;
    require((a << (b ^ c))* -1 >> d == r, "error!");
  }
  
  function q3() public pure {
    int r = 31;
    
    int a = 5;
    int b = 11;
    int c = 16;
    int d = 30;
    require(a | b | c & d == r, "error!");
  }
}
