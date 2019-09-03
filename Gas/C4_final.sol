pragma solidity ^0.5.10;

contract MappingAndArray {
  mapping(uint=>uint) m;
  uint[] a;
  function setM() public {
    m[0] = 0;
    m[1] = 1;
    m[2] = 2;
  }

  function setA() public {
    a.push(0);
    a.push(1);
    a.push(2);
  }
}
