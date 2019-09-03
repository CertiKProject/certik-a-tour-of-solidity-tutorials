pragma solidity ^0.5.10;

contract TicTacToe {
  uint[] board = new uint[](9);
  address player1;
  address player2;
  uint whoseTurn = 1;

  constructor() public {
    player1 = msg.sender;
  }

  function joinGame() public {
    player2 = msg.sender;
  }

  function doMove(uint _place) public returns (uint) {
    board[_place] = whoseTurn;
    whoseTurn = 3 - whoseTurn;

    return 0;
  }
}
