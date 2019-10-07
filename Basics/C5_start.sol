pragma solidity ^0.5.11;

contract HelloWorld {

  uint myFavoriteNumber;
  uint yourFavoriteNumber; 
  address payable ownerAddress;

  constructor(uint num) public {
    myFavoriteNumber = num;
    //set ownerAddress here
  }
  
  function setYourFavoriteNumber(uint a) public payable {
    if( msg.value > 1 ether ) { // 1 ether == 1000000000000000000
      yourFavoriteNumber = a; 
    }
  }
  
  function balanceOfThisContract() public view returns (uint) {
    //this is how you get the balance of a contract
    return address(this).balance; 
  }
  
  //Insecure!! Anyone can call this function and steal the money!
  function withdraw() public {
    (msg.sender).transfer(balanceOfThisContract());
  }
}
