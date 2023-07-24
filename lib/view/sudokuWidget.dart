import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:provider/provider.dart';
import 'package:shadow_sudoku/model/gameState.dart';
import 'package:shadow_sudoku/model/providers.dart';
import 'package:shadow_sudoku/view/actionButtons.dart';
import 'package:shadow_sudoku/view/gridNumbers.dart';
import 'package:shadow_sudoku/view/sudokuGrid.dart';

const Color shadowPurple = Color.fromRGBO(115, 79, 155, 1);

class SudokuWidget extends ConsumerStatefulWidget {
  const SudokuWidget({super.key});

  @override
  _SudokuWidgetState createState() => _SudokuWidgetState();
}

class _SudokuWidgetState extends ConsumerState<SudokuWidget> {
  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateController);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const IntrinsicHeight(
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    child: Icon(SFSymbols.chevron_left, color: shadowPurple)),
                Align(child: Text("Shadow Sudoku")),
                Positioned(
                    right: 0,
                    child: Icon(SFSymbols.gear_alt, color: shadowPurple)),
              ],
            ),
          )),
      body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/SudokuBackground.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Spacer(),
              Container(
                  child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const SudokuGrid(), //HERE
              )),
              const Expanded(
                  child: Row(
                children: [
                  ActionButton(
                      buttonText: "Undo",
                      icon: CupertinoIcons.arrow_counterclockwise),
                  ActionButton(buttonText: "Erase", icon: CupertinoIcons.xmark),
                  ActionButton(
                      buttonText: "Notes", icon: CupertinoIcons.pencil),
                  ActionButton(
                      buttonText: "Hint", icon: CupertinoIcons.lightbulb),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  for (var i = 1; i < 10; i++)
                    Expanded(
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
                        ref.read(gameStateController.notifier).updatePosition(i);
                      },
                      child: Text("$i",
                          style: const TextStyle(
                            color: shadowPurple,
                            fontSize: 50,
                            fontWeight: FontWeight.w300,
                          )),
                    )),
                ],
              )),
              Spacer()
            ]),
          )),
    );
  }
}
