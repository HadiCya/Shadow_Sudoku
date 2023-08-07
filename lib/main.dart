import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/frontPage.dart';
import 'package:shadow_sudoku/model/gridGenerator.dart';
import 'package:shadow_sudoku/model/stack.dart';
import 'package:shadow_sudoku/model/sudokuNumber.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

var initialGrid, solvedGrid;
final undoStack = NewStack<List<List<SudokuNumber>>>();

void main() async {
  var (ig, sg) = await gridGenerator();
  initialGrid = ig; solvedGrid = sg;
  runApp(const ProviderScope(
    child: FrontPage(),
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
