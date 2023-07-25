import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';
import 'package:shadow_sudoku/view/gridNumbers.dart';

final borderMatrix = [
  [0, 1, 1, 0],
  [0, 1, 1, 1],
  [0, 0, 1, 1],
  [1, 1, 1, 0],
  [1, 1, 1, 1],
  [1, 0, 1, 1],
  [1, 1, 0, 0],
  [1, 1, 0, 1],
  [1, 0, 0, 1]
];

class SudokuGrid extends ConsumerStatefulWidget {
  const SudokuGrid({super.key});

  @override
  SudokuGridState createState() => SudokuGridState();
}

class SudokuGridState extends ConsumerState<SudokuGrid> {
  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateController);
    return GridView.builder(
        itemCount: 9,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        physics: const ScrollPhysics(),
        itemBuilder: (buildContext, i) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                  width: borderMatrix[i][0] * 1.0, color: Colors.white),
              right: BorderSide(
                  width: borderMatrix[i][1] * 1.0, color: Colors.white),
              bottom: BorderSide(
                  width: borderMatrix[i][2] * 1.0, color: Colors.white),
              left: BorderSide(
                  width: borderMatrix[i][3] * 1.0, color: Colors.white),
            )),
            alignment: Alignment.center,
            child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                physics: const ScrollPhysics(),
                itemBuilder: (buildContext, j) {
                  return GridNumbers(
                    i: i,
                    j: j,
                    isHighlighted: gameState.displayHighlight(i, j),
                  );
                }),
          );
        });
  }
}
