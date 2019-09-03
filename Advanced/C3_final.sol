pragma solidity ^0.5.10;

contract Animal {
  string name;
  function makeSound() public pure returns(string memory);
}

contract Cat is Animal {
  string name = "cat";
  function makeSound() public pure returns(string memory){
    return "meow";
  }
}


contract Dog is Animal {
  string name = "dog";
  function makeSound() public pure returns(string memory){
    return "bark";
  }
}
