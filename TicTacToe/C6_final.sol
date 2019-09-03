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

  // list of valid winning positions
  uint[][]  tests = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[2,4,6]  ];
  function checkWinner() public view returns (uint){
    for(uint i =0; i < 8;i++){
      uint[] memory b = tests[i];
      if(board[b[0]] != 0 && board[b[0]] == board[b[1]] && board[b[0]] == board[b[2]]) return board[b[0]];
    }


    return 0;
  }

  function doMove(uint _place) public returns (uint) {
    board[_place] = whoseTurn;
    whoseTurn = 3 - whoseTurn;

    return 0;
  }

  function currentState() public view returns(string memory, string memory) {
    string memory text = "No winner yet";
    uint winner = checkWinner();
    if(winner == 1){
      text = "Winner is X";
    }
    if (winner == 2){
      text = "Winner is O";
    }


    bytes memory out = new bytes(11);
    byte[] memory signs = new byte[](3);
    signs[0] = "-";
    signs[1] = "X";
    signs[2] = "O";
    bytes(out)[3] = "\n";
    bytes(out)[7] = "\n";

    for(uint i =0; i < 9;i++){
      bytes(out)[i + i/3] = signs[board[i]];

    }

    return (text, string(out));
  }
}
