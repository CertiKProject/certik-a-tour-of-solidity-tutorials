pragma solidity ^0.5.10;

contract StringTest {
  string a = "fsdf€bÁ";
  bytes32 b = "fsdf€bÁ";

  function getbp() public returns(bytes32) {
    return b;
  }

  function getbe() external returns(bytes32) {
    return b;
  }

  function getbi() internal returns(bytes32) {
    return b;
  }

  function getbpr() private returns(bytes32) {
    return b;
  }

  function getbii() public returns(bytes32) {
    return getbi();
  }

  function getbpri() public returns(bytes32) {
    return getbpr();
  }
}
