import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';

import '../main.dart';
import '../view/sudokuWidget.dart';
import 'gameState.dart';
import 'gridGenerator.dart';

class FrontPageButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  // final GestureDetector;

  const FrontPageButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor, 
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(buttonText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ))),
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: buttonColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {

  final String buttonText;
  final int difficulty;

  const BottomSheetButton({super.key, required this.buttonText, required this.difficulty});
  
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async{
        var (ig, sg) = await gridGenerator();
        initialGrid = ig; solvedGrid = sg;
        gameStateController = StateNotifierProvider<GameStateNotifier, GameState>(
        (ref) => GameStateNotifier());
        Navigator.push(context, MaterialPageRoute(builder: (context) => SudokuWidget(),));
      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w200,
          color: Color.fromARGB(255, 164, 75, 170),
        ),
      ),
    );
  }
}

class BottomSheetDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color.fromARGB(255, 208, 53, 219),
      thickness: 0.5,
      indent: 20,
      endIndent: 20,
    );
  }
}