import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shadow_sudoku/model/fakeGridGenerator.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:shadow_sudoku/view/square.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

class GameState {
  int i = 0;
  int j = 0;
  SudokuNumber num = SudokuNumber();
  var grid = fakeGrid();

  getGridInfo(box, pos) {
    return grid[box][pos].num;
  }

  highlightNumbers(box, pos) {
    i = box;
    j = pos;
    num = grid[box][pos];
  }

  Color isHighlighted(box, pos) {
    if (pos == j && box == i) {
      //Highlights selected box
      return shadowPurple.withOpacity(0.6);
    }
    if ((grid[box][pos].num == grid[i][j].num) && num.num != 0) {
      //Highlights any matching numbers (If 4 is selected, show all 4's)
      return shadowPurple.withOpacity(0.4);
    }
    if ((pos ~/ 3 == j ~/ 3 &&
            box ~/ 3 == i ~/ 3) || //Highlights Horizontal Row
        (pos % 3 == j % 3 && box % 3 == i % 3) || //Highlights Vertical Row
        (box == i)) {
      //Highlights Box
      return shadowPurple.withOpacity(0.2);
    }
    return Colors.transparent;
  }

  updatePosition(int input) {
    var rng = Random(); //Random true or false just for testing
    SudokuNumber temp = SudokuNumber();
    temp.num = input;
    temp.isCorrect = rng.nextBool();
    if (grid[i][j].num == 0) {
      grid[i][j] = temp;
    }
  }

  Square displayNumber(box, pos) {
    String text = "";
    Color color = Colors.white;
    SudokuNumber currentPos = grid[box][pos];
    if (currentPos.num != 0) {
      text = "${currentPos.num}";
    }
    if (currentPos.isSystemGenerated) {
      color = Colors.white;
    } else if (currentPos.isCorrect) {
      color = shadowPurple;
    } else {
      color = Colors.red;
    }
    Square result = Square(text: text, color: color);
    return result;
  }
}

var gameState = GameState();
