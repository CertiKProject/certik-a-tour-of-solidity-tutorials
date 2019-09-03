pragma solidity ^0.5.10;

contract WeirdContract {
  struct Mystruct {
    uint256 hashed;
    uint16 intensity;
    uint8 age;
    uint8 percentage;
    bool flag1;
    bool flag2;
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
