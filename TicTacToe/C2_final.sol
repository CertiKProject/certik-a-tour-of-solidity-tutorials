pragma solidity ^0.5.10;

contract TicTacToe {
  uint[] board = new uint[](9);
  address player1;
  address player2;
  uint whoseTurn = 0;
}
