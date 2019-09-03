pragma solidity ^0.5.10;

contract Aidropping {
  uint remaining = 1223123132;
  address[] public holders;
  mapping (address => uint) public accounts;

  function createaccounts(uint n) public {
      for (uint i = 0; i < n; i++) {
        holders.push(address(n));
        accounts[address(n)] = 1;
      }
  }

  function airdrop() public {
    for(uint i = 0; i < holders.length; i++) {
        remaining -= 100;
        accounts[holders[i]] += 100;
    }
  }
}

