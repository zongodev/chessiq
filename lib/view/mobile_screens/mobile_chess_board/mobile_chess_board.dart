import 'package:chessiq/models/chess_pieces.dart';
import 'package:chessiq/view/mobile_screens/mobile_chess_board/helper/helper.dart';
import 'package:chessiq/view/mobile_screens/mobile_chess_board/widgets/board_square.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({Key? key}) : super(key: key);

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  late List<List<ChessPiece?>> board;
  ChessPiece? selectedPiece;
  int selectedRow = -1;
  int selectedCol = -1;
  List<List<int>> validMoves =[];

  void userSelect(int row , int col){
    if(board[row][col]!=null){
      setState(() {
        selectedPiece=board[row][col];
        selectedRow=row;
        selectedCol=col;
      });
    }
    validMoves=calculateValidMoves(row,col,selectedPiece);

  }
  @override
  void initState() {
    super.initState();
    _initBoard();
  }

  List<List<int>> calculateValidMoves(int row , int col , ChessPiece? selectedPiece){
    List<List<int>> moves = [];
    int direction = selectedPiece!.isWhite? -1:1;
   switch (selectedPiece.type){
     case ChessPiecesType.pawn :
       if(inBoard(row+direction, col)&&(board[row+direction][col]==null)){
         moves.add([row+direction , col]);
       }
       if((row==1&&!selectedPiece.isWhite)||(row==6&&selectedPiece.isWhite)){
         if(inBoard(row+2 * direction, col)&&board[row+2*direction][col]==null&&board[row+direction][col]==null){
           moves.add([row+2*direction,col]);
         }
       }

break;
     case ChessPiecesType.rook:
       var direction=[
         [-1,0],
         [1,0],
         [0,-1],
         [0,1],
       ];

       for(var dir in direction){
         var i=1;
         while(true){
           var newRow=row+1*dir[0];
           var newCol=row+1*dir[1];
           if(!inBoard(newRow, newCol)){
             break;
           }
           if(board[newRow][newCol]!=null){
             if(board[newRow][newCol]!.isWhite!=selectedPiece.isWhite){
               validMoves.add([newRow,newCol]);
             }
             break;
           }
           validMoves.add([newRow,newCol]);
           i++;
         }
       }
       break;

     case ChessPiecesType.knight:
       // TODO: Handle this case.
     case ChessPiecesType.bishop:
       // TODO: Handle this case.
     case ChessPiecesType.queen:
       // TODO: Handle this case.
     case ChessPiecesType.king:
    break;
     default:// TODO: Handle this case.
   }
   return moves;
  }

  void _initBoard() {
    List<List<ChessPiece?>> nBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));
    for (int i = 0; i < nBoard.length; i++) {
      nBoard[1][i] = ChessPiece(
          type: ChessPiecesType.pawn,
          isWhite: false,
          imagePath: "assets/images/black-pawn.png");
      nBoard[6][i] = ChessPiece(
          type: ChessPiecesType.pawn,
          isWhite: true,
          imagePath: "assets/images/black-pawn.png");
    }

    nBoard[0][0] = ChessPiece(
        type: ChessPiecesType.rook,
        isWhite: false,
        imagePath: "assets/images/black-rook.png");
    nBoard[0][7] = ChessPiece(
        type: ChessPiecesType.rook,
        isWhite: false,
        imagePath: "assets/images/black-rook.png");
    nBoard[7][0] = ChessPiece(
        type: ChessPiecesType.rook,
        isWhite: true,
        imagePath: "assets/images/black-rook.png");
    nBoard[7][7] = ChessPiece(
        type: ChessPiecesType.rook,
        isWhite: true,
        imagePath: "assets/images/black-rook.png");

    nBoard[0][1] = ChessPiece(
        type: ChessPiecesType.knight,
        isWhite: false,
        imagePath: "assets/images/black-knight.png");
    nBoard[0][6] = ChessPiece(
        type: ChessPiecesType.knight,
        isWhite: false,
        imagePath: "assets/images/black-knight.png");
    nBoard[7][1] = ChessPiece(
        type: ChessPiecesType.knight,
        isWhite: true,
        imagePath: "assets/images/black-knight.png");
    nBoard[7][6] = ChessPiece(
        type: ChessPiecesType.knight,
        isWhite: true,
        imagePath: "assets/images/black-knight.png");

    nBoard[0][2] = ChessPiece(
        type: ChessPiecesType.bishop,
        isWhite: false,
        imagePath: "assets/images/black-bishop.png");
    nBoard[0][5] = ChessPiece(
        type: ChessPiecesType.bishop,
        isWhite: false,
        imagePath: "assets/images/black-bishop.png");
    nBoard[7][2] = ChessPiece(
        type: ChessPiecesType.bishop,
        isWhite: true,
        imagePath: "assets/images/black-bishop.png");
    nBoard[7][5] = ChessPiece(
        type: ChessPiecesType.bishop,
        isWhite: true,
        imagePath: "assets/images/black-bishop.png");

    nBoard[0][4] = ChessPiece(
        type: ChessPiecesType.king,
        isWhite: false,
        imagePath: "assets/images/black-king.png");
    nBoard[7][4] = ChessPiece(
        type: ChessPiecesType.king,
        isWhite: true,
        imagePath: "assets/images/black-king.png");

    nBoard[0][3] = ChessPiece(
        type: ChessPiecesType.queen,
        isWhite: false,
        imagePath: "assets/images/black-queen.png");
    nBoard[7][3] = ChessPiece(
        type: ChessPiecesType.queen,
        isWhite: true,
        imagePath: "assets/images/black-queen.png");

    board = nBoard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8 * 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8),
              itemBuilder: (context, index) {
                int row = index ~/ 8;
                int col = index % 8;
                bool isSelected=row==selectedRow&&col==selectedCol;
                bool validMove=false;
                for(var pos in validMoves){
                  if(pos[0]==row && pos[1]==col){
                    validMove=true;
                  }
                }
                return BoardSquare(
                  isWhite: isWhite(index),
                  piece: board[row][col],
                  isSelected: isSelected, onTap: () => userSelect(row, col), isValidMove: validMove,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
