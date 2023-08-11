import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:sudoku_api/sudoku_api.dart';

gridGenerator() async {
  PuzzleOptions puzzleOption = PuzzleOptions(patternName: "random");
  Puzzle puzzle = Puzzle(puzzleOption);

  return await puzzle.generate().then((_) {
    // --------------- BOARD -------------------
    List<List<SudokuNumber>> grid =
        List.generate(9, (i) => List.generate(9, (j) => SudokuNumber()));
    var board = puzzle.board();
    List<int> numberCountList = [0, 0, 0, 0, 0, 0, 0, 0, 0];

    for (int r = 0; r < 9; r++) {
      for (Cell c in board!.getRow(r)) {
        if (c.getValue()! != 0) {
          numberCountList[(c.getValue()! - 1)]++;
        }
        //Board
        int y = c.getPosition()!.grid!.y.toInt();
        int box = ((y ~/ 3)) + ((r ~/ 3) * 3); //3
        int pos = (y % 3) + ((r % 3) * 3);
        grid[box][pos] =
            SudokuNumber(num: c.getValue()!, isSystemGenerated: true);
      }
    }

    // ----------- SOLVED BOARD ----------------
    List<List<int>> solvedGrid =
        List.generate(9, (i) => List.generate(9, (j) => 0));
    var solvedBoard = puzzle.solvedBoard();
    printGrid(solvedBoard);
    for (int r = 0; r < 9; r++) {
      for (Cell c in solvedBoard!.getRow(r)) {
        int y = c.getPosition()!.grid!.y.toInt();
        int box = ((y ~/ 3)) + ((r ~/ 3) * 3); //3
        int pos = (y % 3) + ((r % 3) * 3);
        solvedGrid[box][pos] = c.getValue()!;
      }
    }

    return (grid, solvedGrid, numberCountList);
  });
}
