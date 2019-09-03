pragma solidity ^0.5.10;

contract Ownable {
    address internal _owner;
    modifier onlyOwner() {
      require(isOwner());
      _;
    }
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
}
