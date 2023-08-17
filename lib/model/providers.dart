import 'package:flutter/material.dart';
import 'package:shadow_sudoku/main.dart';
import 'package:shadow_sudoku/model/gameState.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

var gameStateController = StateNotifierProvider<GameStateNotifier, GameState>(
    (ref) => GameStateNotifier());

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier()
      : super(GameState(
            i: 0,
            j: 0,
            num: SudokuNumber(),
            grid: initialGrid,
            currMistakes: 0,
            maxMistakes: 3,
            currHints: 0,
            maxHints: 3,
            numberCount: numberCount));

  highlightNumbers(box, pos) {
    state = state.copyWith(i: box, j: pos, num: state.grid[box][pos]);
  }

  updatePosition(int input) {
    SudokuNumber temp = SudokuNumber();
    temp.num = input;
    temp.isCorrect = state.checkCorrect(input);
    List<List<SudokuNumber>> grid = [
      for (var sublist in state.grid) [...sublist]
    ];
    List<int> numCountTemp =
        List.generate(9, (index) => state.numberCount[index]);
    if (grid[state.i][state.j].num == 0) {
      grid[state.i][state.j] = temp;
      if (temp.isCorrect) {
        numCountTemp[input - 1]++;
      }
      state = state.copyWith(
          grid: grid,
          currMistakes:
              (temp.isCorrect ? state.currMistakes : state.currMistakes + 1),
          numberCount: temp.isCorrect ? numCountTemp : state.numberCount);
      undoStack.push(state);
      var winStatus = state.checkWinStatus();
      if (winStatus != null) {
        winStatus ? print("You win!") : print("You lose!"); //Temporary
      }
    }
    if (input == 0 &&
        grid[state.i][state.j].num != 0 &&
        !grid[state.i][state.j].isSystemGenerated) {
      if (grid[state.i][state.j].isCorrect) {
        numCountTemp[grid[state.i][state.j].num - 1]--;
      }
      grid[state.i][state.j] = temp;
      state = state.copyWith(
          grid: grid,
          numberCount: numCountTemp);
      undoStack.push(state);
    }
  }

  undoButton() {
    if (undoStack.isEmpty) {
      return;
    }
    undoStack.pop();
    if (undoStack.isEmpty) {
      state = state.copyWith(grid: initialGrid, numberCount: numberCount);
      return;
    }
    state = undoStack.peek;
  }

  eraseButton() {
    updatePosition(0);
  }

  hintButton(){
    if(state.currHints == 3)
    {
      return;  
    }

    List<List<SudokuNumber>> grid = [
      for (var sublist in state.grid) [...sublist]
    ];

    List index = List<int>.generate(80, (i) => (i + 1), growable: true);
    index.shuffle();

    int row = 0;
    int col = 0;
   
    for(int i = 0; i < index.length; i++)
    {
      row = (index[i] / 9).floor();
      col = index[i] % 9;

      if(grid[row][col].num == 0)
      {
        break;
      }
    }

    if(grid[row][col].num != 0)
    {
      row = 0;
      col = 0;
    }

    SudokuNumber temp = SudokuNumber();
    temp.num = solvedGrid[row][col];
    

    List<int> numCountTemp =
        List.generate(9, (index) => state.numberCount[index]);
    if (grid[row][col].num == 0) {
      grid[row][col] = temp;
      if (temp.isCorrect) {
        numCountTemp[temp.num - 1]++;
      }
    }
    state = state.copyWith(
          grid: grid,
          currMistakes:
              (temp.isCorrect ? state.currMistakes : state.currMistakes + 1),
          currHints: state.currHints + 1,
          numberCount: temp.isCorrect ? numCountTemp : state.numberCount);     
  }
}
