import 'package:flutter/material.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

import '../model/musicPlayer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  static bool musicToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context, true),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        iconTheme: const IconThemeData(
          color: shadowPurple,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                right: MediaQuery.of(context).size.width / 2.7,
                child: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                )),
            const Align(
              child: Text(""),
            ),
            const Positioned(
              right: 0,
              child: Text("")
            ),
          ],
        ),
      ),
      body: Container(
          child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/Dragon_Background.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 8,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Music: ",
                        style: TextStyle(fontSize: 40),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width,
                      ),
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '''
Lead Programmer:
Game Programmer:
Designer:
Music:''',
                          )),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  Column(children: [
                    Switch(
                        value: musicToggle,
                        activeColor: shadowPurple,
                        onChanged: (bool value) {
                          double newVolume;
                          if (value) {
                            newVolume = 1.0;
                          } else {
                            newVolume = 0;
                          }
                          player.setVolume(newVolume);

                          setState(() {
                            musicToggle = value;
                          });
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.width,
                    ),
                    const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '''
Hadi Chaaban
Ahmad Majed
Haris Khan
Zaki Ahmad''',
                        )),
                  ])
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
