pragma solidity ^0.5.11;

contract HelloWorld {

	uint public myFavoriteNumber = 88;
  uint public yourFavoriteNumber;

  function myFavoriteNumberPlusYourFavoriteNumber() public returns (uint) { 
    return myFavoriteNumber + yourFavoriteNumber;
  }
  
  function addTwoNumbers(uint a, uint b) public returns (uint) { 
    return a + b;
  }
  
  //define a new function here to set "yourFavoriteNumber"
  function setYourFavoriteNumber(uint a) public {
    yourFavoriteNumber = a;   
  }
  
  /*
  // Not needed!
  function getMyFavoriteNumber() public returns (uint) { 
    return myFavoriteNumber;
  }*/
}


