pragma solidity ^0.5.10;

contract StringTest {
  string a = "fsdf€bÁ";
  bytes32 b = "fsdf€bÁ";

  function getbp() public view returns(bytes32) {
    return b;
  }

  function getbe() external view returns(bytes32) {
    return b;
  }

  function getbi() internal view returns(bytes32) {
    return b;
  }

  function getbpr() private view returns(bytes32) {
    return b;
  }

  function getbii() public view returns(bytes32) {
    return getbi();
  }

  function getbpri() public view returns(bytes32) {
    return getbpr();
  }
}
