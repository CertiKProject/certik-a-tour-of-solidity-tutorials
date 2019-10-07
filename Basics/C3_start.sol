pragma solidity ^0.5.11;

contract HelloWorld {

  uint public myFavoriteNumber = 88;
  //define a new variable "yourFavoriteNumber" here 
      
  function myFavoriteNumberPlusYourFavoriteNumber() public view returns (uint) { 
    return myFavoriteNumber + yourFavoriteNumber;
  }
  
  function addTwoNumbers(uint a, uint b) public pure returns (uint) { 
    return a + b;
  }
  
  //define a new function here to set "yourFavoriteNumber"

  /*
  // Not needed!
  function getMyFavoriteNumber() public view returns (uint) { 
    return myFavoriteNumber;
  }*/
}


