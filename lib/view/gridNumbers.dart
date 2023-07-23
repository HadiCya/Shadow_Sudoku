import 'package:flutter/material.dart';
import 'package:shadow_sudoku/view/sudokuGrid.dart';

import '../model/fakeGridGenerator.dart';

class GridNumbers extends StatefulWidget {
  const GridNumbers({super.key});

  @override
  State<GridNumbers> createState() => GridNumbersState();
}

class GridNumbersState extends State<GridNumbers> {
  late int i;
  late int j;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: borderMatrix[j][0] * 1.0, color: Colors.black),
          right:
              BorderSide(width: borderMatrix[j][1] * 1.0, color: Colors.black),
          bottom:
              BorderSide(width: borderMatrix[j][2] * 1.0, color: Colors.black),
          left:
              BorderSide(width: borderMatrix[j][3] * 1.0, color: Colors.black),
        )),
        alignment: Alignment.center,
        child: FittedBox(
            fit: BoxFit.fitHeight,
            child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
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
  }
}
