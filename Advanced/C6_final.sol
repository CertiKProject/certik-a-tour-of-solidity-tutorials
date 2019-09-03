pragma solidity ^0.5.10;

contract Ownable {
  address internal _owner;
  constructor() public {
    _owner = msg.sender;
  }
  modifier onlyOwner() {
    require(isOwner());
    _;
  }
  function isOwner() public view returns (bool) {
    return msg.sender == _owner;
  }
}

contract MyContract is Ownable {
  function destroy() public onlyOwner{
    _owner = address(0);
  }
}
