import 'package:flutter/material.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:shadow_sudoku/view/square.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

@immutable
class GameState {
  const GameState(
      {required this.i,
      required this.j,
      required this.num,
      required this.grid});

  final int i;
  final int j;
  final SudokuNumber num;
  final List grid;

  GameState copyWith({int? i, int? j, SudokuNumber? num, List? grid}) {
    return GameState(
        i: i ?? this.i,
        j: j ?? this.j,
        num: num ?? this.num,
        grid: grid ?? this.grid);
  }

  getGridInfo(box, pos) {
    return grid[box][pos].num;
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
