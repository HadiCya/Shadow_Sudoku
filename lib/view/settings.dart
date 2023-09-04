import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:shadow_sudoku/frontPage.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

// import 'lib/model/frontPageWidgets.dart';
// import 'model/gridGenerator.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static bool musicToggle = true;

  @override
  initState(){
    PerfectVolumeControl.hideUI = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () => (
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontPageHome())),
          ),
        ),
        iconTheme: const IconThemeData(
          color: shadowPurple,
        ),
        backgroundColor: const Color.fromARGB(255, 73, 68, 68),
        elevation: 0,
        title: const Stack(
          children: [
            Align(child: Text("Shadow Sudoku"), alignment: Alignment.center),
          ],
        ),
      ),
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
                children: [
                  SizedBox(height: 200,),
                  Row(
                    children: [
                      SizedBox(width: 50,),
                      Text("Music: ", style: TextStyle(fontSize: 40),),
                      Switch(
                        value: musicToggle, 
                        onChanged: (bool value){
                          // setState((){
                            musicToggle = value;
                          // });
                        }
                        )
                      // Slider(
                      //   value: currentVol, 
                      //   activeColor: shadowPurple,
                      //   onChanged: (Volume){
                      //     // currentVol = Volume;
                      //     PerfectVolumeControl.setVolume(Volume);
                      //   },
                      //   min: 0,
                      //   max: 1,
                      //   divisions: 100,
                      //   )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
