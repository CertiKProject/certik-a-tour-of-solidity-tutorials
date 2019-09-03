pragma solidity ^0.5.10;

contract TestBit {

    function q1() public pure {
        uint r = 0;
        
        uint a = 123;
        uint b = 321;
        require(a ^ b == r, "error!"); //fill in here
    }
    
    function q2() public pure {
        uint r = 0;
        
        uint a = 12;
        uint b = 3;
        uint c = 2;
        require(a << (b ^ c) == r, "error!");
    }
    
    function q3() public pure {
        uint r = 0;
        
        uint a = 5;
        uint b = 11;
        uint c = 16;
        uint d = 30;
        require(a | b | c & d == r, "error!");
    }
}

