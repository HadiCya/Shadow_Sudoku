import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';
import 'package:sudoku_api/sudoku_api.dart';

import 'main.dart';
import 'model/gameState.dart';
import 'model/gridGenerator.dart';
import 'model/providers.dart';
import 'model/frontPageWidgets.dart';

class FrontPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/Shadow Sudoku Front Page(vector).png",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Shadow Sudoku",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      )),
                  SizedBox(
                    height: 300,
                  ),
                  GestureDetector(
                    child:FrontPageButton(
                      buttonText: "New Game",
                      buttonColor: Color.fromARGB(255, 164, 75, 170),
                      ),
                      onTap: () => (
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          backgroundColor: Color.fromARGB(255, 31, 31, 31),
                          constraints: BoxConstraints.tight(Size(
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height > 700 ?
                            MediaQuery.of(context).size.height * 0.32 : MediaQuery.of(context).size.height * 0.42,
                          )),
                          context: context,
                          builder: (BuildContext context){
                            return Column(
                              children: [
                                Container(height: 20,),
                                BottomSheetButton(buttonText: "Easy", difficulty: difficultyOptions.easy),
                                SizedBox(height: 20,),
                                BottomSheetDivider(),
                                SizedBox(height: 20,),
                                BottomSheetButton(buttonText: "Medium", difficulty: difficultyOptions.medium),
                                SizedBox(height: 20,),
                                BottomSheetDivider(),
                                SizedBox(height: 20,),
                                BottomSheetButton(buttonText: "Hard", difficulty: difficultyOptions.hard),
                              ],
                            );
                          }
                      )
                    )
                  ),

                  SizedBox(height: 25),

                  GestureDetector(
                    child: FrontPageButton(buttonText: "Continue", buttonColor: Color.fromARGB(255, 69, 66, 66)),
                    onTap: () => (
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SudokuWidget()))
                    ),
                  ),

                  SizedBox(height: 25),

                  FrontPageButton(buttonText: "Settings", buttonColor: Color.fromARGB(255, 69, 66, 66)),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
