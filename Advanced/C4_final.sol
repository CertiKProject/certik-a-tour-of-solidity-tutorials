pragma solidity ^0.5.10;

contract Shopping {
  Receipt[] public receipts;
  
  function sign(uint i) public {
    receipts[i].signReceipt();
  }
  
  function getOwner(uint i) public returns(address){
    return receipts[i].Owner();
  }
  
  function createOrder() public{
    Receipt r = new Receipt(address(this));
    receipts.push(r);
  }
  
  function getSigned(uint i) public returns(bool) {
    return receipts[i].signed();
  }
}

contract Receipt {
  address public Owner;
  bool public signed;

  constructor (address owner) public {
    Owner = owner;
  }
  
  function signReceipt() public {
    signed = true;
  }
}