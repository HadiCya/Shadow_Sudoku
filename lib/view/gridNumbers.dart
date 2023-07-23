import 'package:flutter/material.dart';
import 'package:shadow_sudoku/model/gameState.dart';
import 'package:shadow_sudoku/view/sudokuGrid.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

import '../model/fakeGridGenerator.dart';

class GridNumbers extends StatefulWidget {
  final Function() notifyParent;
  final int i, j;
  final Color isHighlighted;
  const GridNumbers(
      {super.key,
      required this.i,
      required this.j,
      required this.isHighlighted,
      required this.notifyParent});

  @override
  State<GridNumbers> createState() => GridNumbersState();
}

class GridNumbersState extends State<GridNumbers> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.isHighlighted,
            border: Border(
          top: BorderSide(
              width: borderMatrix[widget.j][0] * 1.0, color: Colors.black),
          right: BorderSide(
              width: borderMatrix[widget.j][1] * 1.0, color: Colors.black),
          bottom: BorderSide(
              width: borderMatrix[widget.j][2] * 1.0, color: Colors.black),
          left: BorderSide(
              width: borderMatrix[widget.j][3] * 1.0, color: Colors.black),
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
                onPressed: () {
                  gameState.highlightNumbers(widget.i, widget.j);
                  widget.notifyParent();
                },
                child: gameState.displayNumber(widget.i, widget.j))));
  }
  refresh() {
    setState(() {});
  }
}
