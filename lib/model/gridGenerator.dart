import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:sudoku_api/sudoku_api.dart';

// List<List<int>> bitch = [
//   [1, 2, 4, 7, 9, 5, 6, 3, 8],
//   [3, 5, 6, 1, 2, 8, 4, 7, 9],
//   [7, 8, 9, 3, 4, 6, 1, 2, 5],
//   [2, 1, 3, 4, 5, 7, 8, 9, 6],
//   [4, 6, 5, 2, 8, 9, 3, 1, 7],
//   [8, 9, 7, 6, 1, 3, 2, 5, 4],
//   [5, 3, 1, 8, 7, 4, 9, 6, 2],
//   [6, 7, 8, 9, 3, 2, 5, 4, 1],
//   [9, 4, 2, 5, 6, 1, 7, 8, 2]
// ];

// gridGenerator() {
//   var grid = [];
//   for (int r = 0; r < 9; r++) {
//     for (int c = 0; c < 9; c++) {
//       var value = bitch.elementAt(r).elementAt(c);
//       int box = ((c ~/ 3)) + ((r ~/ 3) * 3); //3
//       int pos = (c % 3) + ((r % 3) * 3);
//       // SudokuNumber temp =
//       //     SudokuNumber(num: c.getValue() ?? 0, isSystemGenerated: true);
//       grid.elementAt(box).removeAt(pos);
//       grid.elementAt(box).insert(pos, value);
//     }
//   }
//   return grid;
// }

Future<List<List<SudokuNumber>>> gridGenerator() async {
  PuzzleOptions puzzleOption = PuzzleOptions(patternName: "random");
  Puzzle puzzle = Puzzle(puzzleOption);

  return await puzzle.generate().then((_) {
    List<List<SudokuNumber>> grid =
        List.generate(9, (i) => List.generate(9, (j) => SudokuNumber()));
    var board = puzzle.board();
    printGrid(board);
    for (int r = 0; r < 9; r++) {
      for (Cell c in board!.getRow(r)) {
        int y = c.getPosition()!.grid!.y.toInt();
        int box = ((y ~/ 3)) + ((r ~/ 3) * 3); //3
        int pos = (y % 3) + ((r % 3) * 3);
        grid[box][pos] =
            SudokuNumber(num: c.getValue()!, isSystemGenerated: true);
      }
    }
    return grid;
  });
}
