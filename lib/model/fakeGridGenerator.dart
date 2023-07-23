import 'dart:math';

import 'package:shadow_sudoku/model/sudokuNumber.dart';

fakeGrid() {
  var rng = Random();
  var grid = [];
  for (int i = 0; i < 10; i++){
    grid.add(List<SudokuNumber>.generate(9, (int index) {
      int num = rng.nextInt(14) + 1;
      if (num > 9) {
        num = 0;
      }
      SudokuNumber temp = SudokuNumber();
      temp.num = num;
      temp.isSystemGenerated = true;
      return temp;
    }));
  }
  return grid;
}
