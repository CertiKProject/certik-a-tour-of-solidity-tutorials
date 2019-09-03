pragma solidity ^0.5.11;

contract HelloWorld {

  uint public myFavoriteNumber = 88;
  uint public yourFavoriteNumber;

  function myFavoriteNumberPlusYourFavoriteNumber() public view returns (uint) { 
    return myFavoriteNumber + yourFavoriteNumber;
  }
  
  function setYourFavoriteNumber(uint a) public {
    yourFavoriteNumber = a;   
  }
}
