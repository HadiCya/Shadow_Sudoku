import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shadow_sudoku/model/fakeGridGenerator.dart';

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

class SudokuGrid extends StatefulWidget {
  const SudokuGrid({super.key});

  @override
  State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  @override
  Widget build(BuildContext context) {
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
                  return Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            width: borderMatrix[j][0] * 1.0,
                            color: Colors.black),
                        right: BorderSide(
                            width: borderMatrix[j][1] * 1.0,
                            color: Colors.black),
                        bottom: BorderSide(
                            width: borderMatrix[j][2] * 1.0,
                            color: Colors.black),
                        left: BorderSide(
                            width: borderMatrix[j][3] * 1.0,
                            color: Colors.black),
                      )),
                      alignment: Alignment.center,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: TextButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return Colors.transparent;
                                  },
                                ),
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () => highlightNumbers(i, j),
                              child: Text(
                                "${grid[i][j]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                ),
                              ))));
                }),
          );
        });
  }
}

highlightNumbers(box, pos){
  print("${box}, ${pos}");
}
