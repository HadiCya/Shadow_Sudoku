import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shadow_sudoku/model/gameState.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:shadow_sudoku/view/square.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameStateController = StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) => GameStateNotifier());

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState(i: 0, j: 0, num: SudokuNumber()));

  highlightNumbers(box, pos) {
    state = GameState(i: box, j: pos, num: state.grid[box][pos]);
  }

  updatePosition(int input) {
    var newState = GameState(i: state.i, j: state.j, num: state.num);
    var rng = Random(); //Random true or false just for testing
    SudokuNumber temp = SudokuNumber();
    temp.num = input;
    temp.isCorrect = rng.nextBool();
    if (newState.grid[newState.i][newState.j].num == 0) {
      newState.grid[newState.i][newState.j] = temp;
    }
    state = newState;
  }
}
