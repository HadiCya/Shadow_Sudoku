import 'dart:math';

import 'package:shadow_sudoku/main.dart';
import 'package:shadow_sudoku/model/gameState.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameStateController = StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) => GameStateNotifier());

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier()
      : super(GameState(
            i: 0,
            j: 0,
            num: SudokuNumber(),
            grid: initialGrid));

  highlightNumbers(box, pos) {
    state = state.copyWith(i: box, j: pos, num: state.grid[box][pos]);
  }

  updatePosition(int input) {
    var rng = Random(); //Random true or false just for testing
    SudokuNumber temp = SudokuNumber();
    temp.num = input;
    temp.isCorrect = rng.nextBool();
    List<List<SudokuNumber>> grid = [for (var sublist in state.grid) [...sublist]];

    if (grid[state.i][state.j].num == 0) {
      grid[state.i][state.j] = temp;
      undoStack.push(grid);
    }
    state = state.copyWith(grid: grid);
  }

  undoButton() {
    if (undoStack.isEmpty) {
      return;
    }
    undoStack.pop();
    if (undoStack.isEmpty) {
      state = state.copyWith(grid: initialGrid);
      return;
    }
    state = state.copyWith(grid: undoStack.peek);
  }
}
