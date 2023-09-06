import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'dart:math';

enum difficultyOptions { easy, medium, hard }

gridGenerator(difficultyOptions difficulty) async {
  PuzzleOptions puzzleOption = PuzzleOptions(patternName: "random");
  Puzzle puzzle = Puzzle(puzzleOption);

  return await puzzle.generate().then((_) {
    var solvedBoard = puzzle.solvedBoard();
    // --------------- BOARD -------------------
    var board = puzzle.board();
    var (grid, numberCountList) =
        generateBoardWithDifficulty(board!, solvedBoard!, difficulty);

    // ----------- SOLVED BOARD ----------------
    List<List<int>> solvedGrid =
        List.generate(9, (i) => List.generate(9, (j) => 0));
    printGrid(solvedBoard);
    for (int r = 0; r < 9; r++) {
      for (Cell c in solvedBoard.getRow(r)) {
        int y = c.getPosition()!.grid!.y.toInt();
        int box = ((y ~/ 3)) + ((r ~/ 3) * 3); //3
        int pos = (y % 3) + ((r % 3) * 3);
        solvedGrid[box][pos] = c.getValue()!;
      }
    }

    return (grid, solvedGrid, numberCountList);
  });
}

generateBoardWithDifficulty(
    Grid board, Grid solvedBoard, difficultyOptions difficulty) {
  List<List<SudokuNumber>> grid =
      List.generate(9, (i) => List.generate(9, (j) => SudokuNumber()));
  List<int> numberCountList = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  var rng = Random();
  var difficultyMod = 10;


  switch (difficulty) {
    case difficultyOptions.easy:
      difficultyMod = 7;
    case difficultyOptions.medium:
      difficultyMod = 8;
    case difficultyOptions.hard:
      difficultyMod = 9;
  }

  for (int r = 0; r < 9; r++) {
    for (Cell c in board.getRow(r)) {
      int y = c.getPosition()!.grid!.y.toInt();
      int tempC = c.getValue()!;
      if (tempC == 0 && (rng.nextInt(10) > difficultyMod)) {
        tempC = solvedBoard.cellAt(Position(row: r, column: y)).getValue()!;
      }
      if (tempC != 0) {
        numberCountList[(tempC - 1)]++;
      }
      //Board
      int box = ((y ~/ 3)) + ((r ~/ 3) * 3); //3
      int pos = (y % 3) + ((r % 3) * 3);
      grid[box][pos] = SudokuNumber(num: tempC, isSystemGenerated: true);
    }
  }
  return (grid, numberCountList);
}
