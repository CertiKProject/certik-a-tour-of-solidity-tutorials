pragma solidity ^0.5.11;

contract HelloWorld {

  mapping(address => uint) public yourFavoriteNumber; 
	address payable ownerAddress;

  constructor() public {
    ownerAddress = msg.sender;
  }
    
  modifier needsMoney(uint cost) {
    require(msg.value >= cost, "Not enough money attached to function");
    _;
  }
  
  modifier onlyOwner() {
    require(msg.sender == ownerAddress, "Must be contract owner to call this function");
    _;
  }
  
  function setYourFavoriteNumber(uint a) public payable needsMoney(1 ether) {
    yourFavoriteNumber[msg.sender] = a; 
  }
  
  function balanceOfThisContract() public view returns (uint) {
    return address(this).balance; 
  }
  
  function withdraw() public onlyOwner() {
    (msg.sender).transfer(balanceOfThisContract());
  }
}
