import 'package:flutter/material.dart';
import 'package:shadow_sudoku/main.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:shadow_sudoku/view/square.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

@immutable
class GameState {
  const GameState(
      {required this.i,
      required this.j,
      required this.num,
      required this.grid,
      required this.currMistakes,
      required this.maxMistakes,
      required this.currHints,
      required this.maxHints,
      required this.numberCount});

  final int i, j, currMistakes, maxMistakes, currHints, maxHints;
  final List<int> numberCount;
  final SudokuNumber num;
  final List<List<SudokuNumber>> grid;

  GameState copyWith(
      {int? i,
      int? j,
      SudokuNumber? num,
      List<List<SudokuNumber>>? grid,
      int? currMistakes,
      int? maxMistakes,
      int? currHints,
      int? maxHints,
      List<int>? numberCount}) {
    return GameState(
        i: i ?? this.i,
        j: j ?? this.j,
        num: num ?? this.num,
        grid: grid ?? this.grid,
        currMistakes: currMistakes ?? this.currMistakes,
        maxMistakes: maxMistakes ?? this.maxMistakes,
        currHints: currHints ?? this.currHints,
        maxHints: maxHints ?? this.maxHints,
        numberCount: numberCount ?? this.numberCount);
  }

  getGridInfo(box, pos) {
    return grid[box][pos].num;
  }

  bool checkCorrect(int input) {
    return input == solvedGrid[i][j];
  }

  checkWinStatus() {
    if (currMistakes == maxMistakes) {
      return false;
    }
    int product = 1;
    for (int n = 0; n < 9; n++) {
      for (int m = 0; m < 9; m++) {
        product *= grid[n][m].num;
        if (!grid[n][m].isCorrect) {
          return null;
        }
      }
    }
    return product != 0 ? true : null;
  }

  Color displayHighlight(box, pos) {
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
      color = const Color.fromRGBO(203, 195, 227, 1);
    } else {
      color = Colors.red;
    }
    Square result = Square(text: text, color: color);
    return result;
  }
}
