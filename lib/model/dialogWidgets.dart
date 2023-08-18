
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';

import '../frontPage.dart';
import '../main.dart';
import '../view/sudokuWidget.dart';
import 'gameState.dart';
import 'gridGenerator.dart';
import 'providers.dart';


class dialogText extends ConsumerWidget {

  // final String textAttribute;
  final GameStats gameStats;

  dialogText(this.gameStats);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateController);
    List<int> statsList = [gameState.currMistakes, gameState.currHints, 0, 0];
    return Align(
      alignment: const Alignment(-0.5, 0.5),
      child: Text(
        gameStats.text  + statsList[gameStats.stats].toString(),
        textAlign: TextAlign.start,
        style: const TextStyle(
        color: Colors.white, 
        fontSize: 30,
        fontWeight: FontWeight.w300,
        )
      ),
    );
  }
}

class winLoseDialog extends ConsumerWidget{

  final bool winStatus;

  winLoseDialog(this.winStatus);

 Widget build(BuildContext context, WidgetRef ref){
  return SimpleDialog(
    backgroundColor: Colors.transparent,
    contentPadding: EdgeInsets.zero,
    children: [
      Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 81, 82, 84),
            border: Border.all(
                color: const Color.fromARGB(
                    255, 62, 62, 64),
                width: 4),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(winStatus ? "You Win" : "You Lose",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight:
                        FontWeight.w300,
                  )),
              const Divider(
                color: Color.fromARGB(
                    255, 62, 62, 64),
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              dialogText(
                  GameStats.time),
              const SizedBox(
                height: 10,
              ),
              dialogText(
                  GameStats.hints),
              const SizedBox(
                height: 10,
              ),
              dialogText(
                  winStatus ? GameStats.mistakes: GameStats.none),
            ],
          )),
      
      GestureDetector(
        child: Transform.translate(
          offset: const Offset(0, -25),
          child: Center(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: shadowPurple,
                borderRadius:
                    BorderRadius.circular(
                        100),
              ),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text("Back to Menu",
                      textAlign:
                          TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight:
                            FontWeight.w400,
                      ))),
            ),
          )),
        onTap: () async{
          var (ig, sg, nc) = await gridGenerator();
          initialGrid = ig; solvedGrid = sg; numberCount = nc;
          gameStateController = StateNotifierProvider<GameStateNotifier, GameState>(
          (ref) => GameStateNotifier());
          Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontPageHome(),));
        },
        
      ),
    ],
  );
 }
}

  enum GameStats{
  mistakes,
  hints,
  time, 
  none
}

extension GameStatExtension on GameStats{
  String get text {
    switch(this){
      case GameStats.mistakes:
        return "\t\tMistakes: ";
      case GameStats.hints:
        return "Hints: ";
      case GameStats.time:
        return "Time: ";
      case GameStats.none:
        return "";
    }
  }

  int get stats{
    switch(this){
      case GameStats.mistakes:
        return 0;
      case GameStats.hints:
        return 1;
      case GameStats.time:
        return 2;
      case GameStats.none:
        return 3;
    }
  }
}

