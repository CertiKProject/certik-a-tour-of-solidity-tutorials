pragma solidity ^0.5.11;

contract HelloWorld {
    
  function sayHello() public pure returns (string memory) {
    return "Hello World";
  }
  
  function myFavoriteNumber() public pure returns (uint) { 
    return 88;
  }
  
  function myFavoriteNumberPlusYourNumber(uint a) public pure returns (uint) { 
    return myFavoriteNumber() + a;
  }
  
  function whoseAddress() public view returns(address) {
    return msg.sender;
  }   

  function howMuchMoney() public payable returns(uint) {
    return msg.value;
  }   
}
