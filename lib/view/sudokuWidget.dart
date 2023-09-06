import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:shadow_sudoku/frontPage.dart';
import 'package:shadow_sudoku/model/providers.dart';
import 'package:shadow_sudoku/view/actionButtons.dart';
import 'package:shadow_sudoku/view/settings.dart';
import 'package:shadow_sudoku/view/sudokuGrid.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';
import "package:audioplayers/audioplayers.dart";
import "package:flutter/services.dart";

import '../model/musicPlayer.dart';
import 'sudokuWidget.dart';

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

class _SudokuWidgetState extends ConsumerState<SudokuWidget> with WidgetsBindingObserver {

  Duration duration = Duration();
  Timer? timer;
  bool justOpended = true;
  bool active = true;
  int timeHeight = 0;
  

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.paused){
      active = false;
    }
    else if(state == AppLifecycleState.resumed){
      active = true;
    }
  }

  void addTime(){
    final addSeconds = 1;

    if(active)
    {
      setState((){
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
    }
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    playMusic();
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateController);

    twoDigits(int n) => n.toString().padLeft(2, '0');    
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    if(justOpended)
    {
      duration = Duration(seconds: gameState.time);
      justOpended = false;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () => (  
            HapticFeedback.mediumImpact(),        
            ref.read(gameStateController.notifier).updateTime(duration.inSeconds),
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FrontPageHome())),
          ),
        ),
        iconTheme: const IconThemeData(
          color: shadowPurple,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Stack(
          children: [
            Align(child: Text("Shadow Sudoku")),
            Positioned(
                right: 0, child: GestureDetector(
                  child: const Icon(SFSymbols.gear_alt, color: shadowPurple),
                  onTap: () => (
                  ref.read(gameStateController.notifier).updateTime(duration.inSeconds),
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings())),
                  )),),
                
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
                Center(
                  // left: 175,
                  // top: (MediaQuery.of(context).size.height / 12),
                   heightFactor: MediaQuery.of(context).size.height > 700 ? 10: 7.5,
                  // heightFactor: 10,
                  child: Text(
                      "${minutes}:${seconds}",
                      style: TextStyle(color: shadowPurple),),               
                ),
              ]),
              Expanded(
                  child: Row(
                children: [
                  ActionButton(
                      buttonText: "Erase",
                      icon: CupertinoIcons.xmark,
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        ref.read(gameStateController.notifier).eraseButton();
                      }),
                  ActionButton(
                      buttonText: "Notes", 
                      icon: CupertinoIcons.pencil,
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        ref.read(gameStateController.notifier).noteMode();
                      }),
                  ActionButton(
                    buttonText: "Hint",
                    icon: CupertinoIcons.lightbulb,
                    onPressed: () {   
                      HapticFeedback.mediumImpact();                                         
                      var winStatus = ref.read(gameStateController.notifier).hintButton();
                      ref.read(gameStateController.notifier).updateTime(duration.inSeconds);
                      if(winStatus)
                        setState(() => timer?.cancel());
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
                            ref.read(gameStateController.notifier).updateTime(duration.inSeconds);
                            HapticFeedback.mediumImpact();
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
                              style: TextStyle(
                                color: gameState.isNoteMode ? Colors.amber : shadowPurple,
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
