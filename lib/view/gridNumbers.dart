import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';
import 'package:shadow_sudoku/view/sudokuGrid.dart';

class GridNumbers extends ConsumerStatefulWidget {
  final int i, j;
  final Color isHighlighted;
  const GridNumbers(
      {super.key,
      required this.i,
      required this.j,
      required this.isHighlighted});

  @override
  _GridNumbersState createState() => _GridNumbersState();
}

class _GridNumbersState extends ConsumerState<GridNumbers> {
  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateController);
    return Container(
        decoration: BoxDecoration(
            color: widget.isHighlighted,
            border: Border(
              top: BorderSide(
                  width: 1.0, color: (borderMatrix[widget.j][0] == 1 ? Colors.black : Colors.transparent)),
              right: BorderSide(
                  width: 1.0, color: (borderMatrix[widget.j][1] == 1 ? Colors.black : Colors.transparent)),
              bottom: BorderSide(
                  width: 1.0, color: (borderMatrix[widget.j][2] == 1 ? Colors.black : Colors.transparent)),
              left: BorderSide(
                  width: 1.0, color: (borderMatrix[widget.j][3] == 1 ? Colors.black : Colors.transparent)),
            )),
        alignment: Alignment.center,
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
              ref
                  .read(gameStateController.notifier)
                  .highlightNumbers(widget.i, widget.j);
            },
            child: gameState.displayNumber(widget.i, widget.j)));
  }
}
