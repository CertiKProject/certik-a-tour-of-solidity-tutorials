pragma solidity ^0.5.10;

contract Math {
  function am(uint x, uint y, uint m) public pure returns(uint){
    return addmod(x,y,m);
  }
  
  function mm(uint x, uint y, uint m) public pure returns(uint){
    return mulmod(x,y,m);
  }
  
  function kec(bytes memory m) public pure returns(bytes32) {
    return keccak256(m);
  }
  
  function s256(bytes memory m) public pure returns(bytes32) {
    return sha256(m);
  }
  
  function rm160(bytes memory m) public pure returns(bytes20) {
    return ripemd160(m);
  }
  
  function erecover(bytes32 hash, uint8 v, bytes32 r, bytes32 s)public pure returns(address) {
    return ecrecover(hash,v,r,s);
  }
}