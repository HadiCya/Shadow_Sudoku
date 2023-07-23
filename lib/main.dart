import 'package:flutter/material.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

void main() {
  runApp(const ShadowSudoku());
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
