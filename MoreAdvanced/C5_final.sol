pragma solidity ^0.5.11;

contract Caller {
  uint public x = 0;
  
  event EtherReceived(uint amount);
  function callTest() public {
    address(this).call('0xabcdefgh'); // hash does not exist
    // results in Test(testAddress).x becoming == 1.
  }
  function() external payable {
    x = 1;
    emit EtherReceived(msg.value);
  }
}
