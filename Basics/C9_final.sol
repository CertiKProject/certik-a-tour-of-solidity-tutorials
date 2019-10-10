pragma solidity ^0.5.11;

contract HelloWorld {

  struct UserInfo {
    uint favoriteNumber;
    uint moneySent;
    uint indexNumber;
  }
  
  mapping(address => UserInfo) public userInfoTable;
  address[] public userList; 
  
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
    // check to see if user exists yet 
    if(userInfoTable[msg.sender].indexNumber == 0) {
      //if not add them to the array
      userList.push(msg.sender);
      userInfoTable[msg.sender].indexNumber = userList.length; //will be index in the array +1
    }
    userInfoTable[msg.sender].favoriteNumber = a;
    userInfoTable[msg.sender].moneySent += msg.value;
  }
  
  function balanceOfThisContract() public view returns (uint) {
    return address(this).balance; 
  }
  
  function withdraw() public onlyOwner() {
    (msg.sender).transfer(balanceOfThisContract());
  }
  
  //make these functions
  function numberOfUsers() public view returns (uint) {
    return userList.length;
  }
  
  function deleteUserData() public {
    //a user should be able to delete their own data (and no one elses)
    //if they do this, numberOfUsers() should be subtracted by one
    //HINT: you may need to modify UserInfo to make this happen
    //HINT 2: you will need to delete data from the middle of an array,
    //and then remove the "gap". is there a way to do this without using 
    //a for loop, if we don't care about preserving the order?
    uint i = userInfoTable[msg.sender].indexNumber - 1;
    userList[i] = userList[userList.length-1];
    delete userList[userList.length-1];
    userInfoTable[userList[i]].indexNumber = i+1;
    userList.length--;
  }
}
