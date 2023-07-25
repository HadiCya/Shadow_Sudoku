import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/fakeGridGenerator.dart';
import 'package:shadow_sudoku/model/stack.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

final initialGrid = fakeGrid();
final undoStack = NewStack<List>();

void main() {
  runApp(ProviderScope(
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
      home: SudokuWidget(),
    );
  }
}
