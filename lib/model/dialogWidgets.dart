
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/model/providers.dart';

import '../frontPage.dart';
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
      alignment: const Alignment(-0.5, 0.5),
      child: Text(
        textAttribute == "\t\tMistakes" ? "$textAttribute: ${gameState.currMistakes}" : 
        textAttribute == "Hints" ? "$textAttribute: ${gameState.currHints}" : 
        textAttribute == "Time" ? "$textAttribute: ${gameState.currHints}":
        textAttribute,
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
              const dialogText(
                  textAttribute: "Time"),
              const SizedBox(
                height: 10,
              ),
              const dialogText(
                  textAttribute: "Hints"),
              const SizedBox(
                height: 10,
              ),
              const dialogText(
                  textAttribute:
                      "\t\tMistakes"),
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

