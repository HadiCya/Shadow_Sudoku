import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:shadow_sudoku/frontPage.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  
  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {

  static bool musicToggle = true;
  static final player = AudioPlayer();
  
  @override
  Settings createState() => Settings();

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
                children: [
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      GestureDetector(
                          child: const Icon(Icons.arrow_back_ios_new, color: shadowPurple,),
                          onTap: () => (
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const FrontPageHome())),
                          ),
                      ),
                  SizedBox(width: 125),
                  Text("Settings", style: TextStyle(fontSize: 30),),
                ],
                ),
                  SizedBox(height: 200,),
                  Row(
                    children: [
                      SizedBox(width: 100,),
                      Text("Music: ", style: TextStyle(fontSize: 40),),
                      Switch(
                        value: musicToggle, 
                        activeColor: shadowPurple,
                        onChanged: (bool value){
                          double newVolume;
                          if(value){
                            newVolume = 100;
                          }
                          else{
                            newVolume = 0;
                          }
                          player.setVolume(newVolume);

                          setState((){
                            musicToggle = value;
                          });
                        }
                        )
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
