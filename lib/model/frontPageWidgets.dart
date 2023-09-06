import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';
import "package:flutter/services.dart";

import '../main.dart';
import '../view/sudokuWidget.dart';
import 'gameState.dart';
import 'gridGenerator.dart';

class FrontPageButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const FrontPageButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor, 
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: buttonColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
          child: Text(buttonText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ))),
    );
  }
}

class BottomSheetButton extends StatelessWidget {

  final String buttonText;
  final difficultyOptions difficulty;

  const BottomSheetButton({super.key, required this.buttonText, required this.difficulty});
  
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async{
        HapticFeedback.mediumImpact();
        var (ig, sg, nc) = await gridGenerator(difficulty);
        initialGrid = ig; solvedGrid = sg; numberCount = nc;
        gameStateController = StateNotifierProvider<GameStateNotifier, GameState>(
        (ref) => GameStateNotifier());
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SudokuWidget(),));
      },
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w200,
          color: Color.fromARGB(255, 164, 75, 170),
        ),
      ),
    );
  }
}

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({super.key});


  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(255, 208, 53, 219),
      thickness: 0.5,
      indent: 20,
      endIndent: 20,
    );
  }
}