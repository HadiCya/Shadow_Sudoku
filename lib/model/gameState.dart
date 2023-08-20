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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 989214b0e0c79dce48dd2f2b10ea9fe045441c0d
      required this.currHints,
      required this.maxHints,
      required this.numberCount});

  final int i, j, currMistakes, maxMistakes, currHints, maxHints;
<<<<<<< HEAD
=======
      required this.elapsedMinutes,
      required this.elaspedSeconds,
      required this.numberCount});

  final int i, j, currMistakes, maxMistakes, elapsedMinutes, elaspedSeconds;
>>>>>>> 1fefdb5 (Visible timer)
=======
      required this.currHints,
      required this.maxHints,
      required this.numberCount});

  final int i, j, currMistakes, maxMistakes, currHints, maxHints;
>>>>>>> 989214b (Merge Fixes)
=======
>>>>>>> 989214b0e0c79dce48dd2f2b10ea9fe045441c0d
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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      int? currHints,
      int? maxHints,
=======
      int? elapsedMinutes,
      int? elaspedSeconds,
>>>>>>> 1fefdb5 (Visible timer)
=======
      int? currHints,
      int? maxHints,

>>>>>>> 989214b (Merge Fixes)
=======
      int? currHints,
      int? maxHints,

>>>>>>> 989214b0e0c79dce48dd2f2b10ea9fe045441c0d
      List<int>? numberCount}) {
    return GameState(
        i: i ?? this.i,
        j: j ?? this.j,
        num: num ?? this.num,
        grid: grid ?? this.grid,
        currMistakes: currMistakes ?? this.currMistakes,
        maxMistakes: maxMistakes ?? this.maxMistakes,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        currHints: currHints ?? this.currHints,
        maxHints: maxHints ?? this.maxHints,
=======
        elapsedMinutes: elapsedMinutes ?? this.elapsedMinutes,
        elaspedSeconds: elaspedSeconds ?? this.elaspedSeconds,
>>>>>>> 1fefdb5 (Visible timer)
=======
        currHints: currHints ?? this.currHints,
        maxHints: maxHints ?? this.maxHints,
>>>>>>> 989214b (Merge Fixes)
=======
        currHints: currHints ?? this.currHints,
        maxHints: maxHints ?? this.maxHints,
>>>>>>> 989214b0e0c79dce48dd2f2b10ea9fe045441c0d
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