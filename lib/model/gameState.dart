import 'package:flutter/material.dart';
import 'package:shadow_sudoku/model/fakeGridGenerator.dart';

class GameState{
  int i = 0;
  int j = 0;
  int num = 0;

  highlightNumbers(box, pos){
    i = box;
    j = pos;
    num = grid[box][pos];
    isHighlighted(box, pos);
  }

  Color isHighlighted(box, pos){
    bool matchingNumber = grid[box][pos] == grid[i][j];
    //if my position is 0, 1, 2, then all 0, 1, 2 across the board should be selected
    // 345 -> 345 and 678 -> 678
    Color result = Colors.transparent;
    if ((pos ~/ 3 == j ~/ 3 && box ~/ 3 == i ~/ 3) || (pos % 3 == j % 3 && box % 3 == i % 3) || (box == i) || matchingNumber){
      result = Color.fromRGBO(115, 79, 155, 0.3);
    }
    return result;
  }
}

var gameState = GameState();