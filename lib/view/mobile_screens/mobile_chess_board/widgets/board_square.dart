import 'package:chessiq/models/chess_pieces.dart';
import 'package:flutter/material.dart';

class BoardSquare extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool? isSelected;
  final bool? isValidMove;
  final Function() onTap;
  const BoardSquare({Key? key, required this.isWhite, required this.piece , required this.isSelected, required this.onTap, required this.isValidMove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? squareColor ;
    if(isSelected==true){
      squareColor=Colors.green;
    }else if (isValidMove==true){
      squareColor=Colors.green[200];
    }
    else {
      squareColor= isWhite ? Colors.grey[400] : Colors.grey[600];
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color:squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
