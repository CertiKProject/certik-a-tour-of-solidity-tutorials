pragma solidity ^0.5.10;

contract WeirdContract {
  struct Mystruct {
    bool flag1;
    bool flag2;
    uint256 hashed;
    uint8 age;
  }

  Mystruct mystruct;

  function setms() public {
    mystruct.hashed = 1;
    mystruct.intensity = 1;
    mystruct.age = 1;
    mystruct.percentage = 1;
    mystruct.flag1 = true;
    mystruct.flag2 = false;
  }
}
