import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/gameState.dart';
import 'package:shadow_sudoku/model/gridGenerator.dart';
import 'package:shadow_sudoku/model/stack.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

var initialGrid, solvedGrid, numberCount;
final undoStack = NewStack<GameState>();

void main() async {
  var (ig, sg, nc) = await gridGenerator();
  initialGrid = ig; solvedGrid = sg; numberCount = nc;
  runApp(const ProviderScope(
    child: ShadowSudoku(),
  ));
}

class ShadowSudoku extends StatelessWidget {
  const ShadowSudoku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shadow Sudoku",
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white)),
      home: const SudokuWidget(),
    );
  }
}
