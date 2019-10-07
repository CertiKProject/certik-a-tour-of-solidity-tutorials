pragma solidity ^0.5.11;

contract HelloWorld {

  uint myFavoriteNumber;
  uint yourFavoriteNumber; 
  address payable ownerAddress;

  constructor(uint num) public {
    myFavoriteNumber = num;
    ownerAddress = msg.sender;
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
  
  //Secure now
  function withdraw() public {
    require(msg.sender == ownerAddress, "Don't try to touch my money!");
    (msg.sender).transfer(balanceOfThisContract());
  }
}
