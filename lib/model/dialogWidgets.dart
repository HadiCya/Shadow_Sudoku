import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';

import '../main.dart';
import '../view/sudokuWidget.dart';
import 'gameState.dart';
import 'gridGenerator.dart';

class dialogText extends ConsumerWidget {

  final String textAttribute;
  

  const dialogText({super.key, required this.textAttribute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateController);
    return Align(
      alignment: Alignment(-0.5, 0.5),
      child: Text(
        textAttribute == "Mistakes" ? textAttribute + ": " + gameState.currMistakes.toString() : 
        textAttribute == "Hints" ? textAttribute + ": " + gameState.currHints.toString() : 
        textAttribute == "Time" ? textAttribute + ": " + gameState.currHints.toString():
        textAttribute,
        textAlign: TextAlign.start,
        style: TextStyle(
        color: Colors.white, 
        fontSize: 30,
        fontWeight: FontWeight.w300,
        )
      ),
    );
  }
}