pragma solidity ^0.5.11;

contract HelloWorld {

  struct UserInfo {
    uint favoriteNumber;
    uint moneySent;
  }
    
  mapping(address => UserInfo) public userInfoTable; 
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
    userInfoTable[msg.sender].favoriteNumber = a;
    userInfoTable[msg.sender].moneySent += msg.value;
  }
  
  function balanceOfThisContract() public view returns (uint) {
    return address(this).balance; 
  }
  
  function withdraw() public onlyOwner() {
    (msg.sender).transfer(balanceOfThisContract());
  }
}
