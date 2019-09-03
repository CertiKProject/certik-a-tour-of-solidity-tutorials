pragma solidity ^0.5.10;

contract UseGlobal {
  address public owner;
  address public referrer;
  uint public birth;
  constructor() public {
    owner = msg.sender;
    referrer = tx.origin;
    birth = block.timestamp;
  }

  function use() public payable {
    require(block.timestamp > 100000000);
  }
  
  function transfer(address a) public {
    require(msg.sender == owner);
    owner = a;
  }
}
