import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:shadow_sudoku/frontPage.dart';
import 'package:shadow_sudoku/model/providers.dart';
import 'package:shadow_sudoku/view/actionButtons.dart';
import 'package:shadow_sudoku/view/sudokuGrid.dart';

import '../main.dart';
import '../model/dialogWidgets.dart';
import '../model/gameState.dart';
import '../model/gridGenerator.dart';

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
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () => (
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FrontPageHome())),
          ),
        ),
        iconTheme: const IconThemeData(
          color: shadowPurple,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Stack(
          children: [
            Align(child: Text("Shadow Sudoku")),
            Positioned(
                right: 0, child: Icon(SFSymbols.gear_alt, color: shadowPurple)),
          ],
        ),
      ),
      body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/SudokuBackground.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
            child: Column(children: [
              Container(height: MediaQuery.of(context).size.height / 15),
              Stack(children: [
                Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 0),
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 0, bottom: 0),
                    width: double.maxFinite,
                    alignment: Alignment.topCenter,
                    child: const SudokuGrid()),
                Positioned(
                  left: 15,
                  top: (MediaQuery.of(context).size.height / 12),
                  child: Text(
                      "Mistakes: ${gameState.currMistakes}/${gameState.maxMistakes}"),
                ),
                Positioned(
                  right: 15,
                  top: (MediaQuery.of(context).size.height / 12),
                  child: Text(
                      "Hints: ${gameState.currHints}/${gameState.maxHints}"),
                ),
              ]),
              Expanded(
                  child: Row(
                children: [
                  ActionButton(
                      buttonText: "Erase",
                      icon: CupertinoIcons.xmark,
                      onPressed: () {
                        ref.read(gameStateController.notifier).eraseButton();
                      }),
                  const ActionButton(
                      buttonText: "Notes", icon: CupertinoIcons.pencil),
                  ActionButton(
                    buttonText: "Hint",
                    icon: CupertinoIcons.lightbulb,
                    onPressed: () {
                      var winStatus = ref.read(gameStateController.notifier).hintButton();
                      if (winStatus != null) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => 
                                       winLoseDialog(winStatus)
                                );
                            }
                    },
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  for (var i = 1; i < 10; i++)
                    Expanded(
                        child: Column(
                      children: [
                        Text("${gameState.numberCount[i - 1]}"),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                return Colors.transparent;
                              },
                            ),
                            splashFactory: NoSplash.splashFactory,
                          ),
                          onPressed: () {
                            var winStatus = ref.read(gameStateController.notifier).updatePosition(i);
                            if (winStatus != null) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => 
                                       winLoseDialog(winStatus)
                                );
                            }

                          
                          },
                          child: Text("$i",
                              style: const TextStyle(
                                color: shadowPurple,
                                fontSize: 46,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    )),
                ],
              )),
            ]),
          )),
    );
  }
}
