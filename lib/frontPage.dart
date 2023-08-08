import 'package:flutter/material.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

import 'main.dart';
import 'model/gridGenerator.dart';

class FrontPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "assets/images/Shadow Sudoku Front Page(vector).png"),
            fit: BoxFit.fill),
      ),
      child: Column(children: [
        Container(
          height: 125,
        ),
        Text(
          "Shadow Sudoku",
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.w200,
            //letterSpacing: 10
          ),
        ),
        Container(
          height: 350,
        ),
        GestureDetector(
          onTap: () => (showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 31, 31, 31),
            constraints: BoxConstraints.tight(Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.35,
            )),
            context: context,
            builder: (BuildContext context) {
              return Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () async {
                          var (ig, sg) = await gridGenerator();
                          initialGrid = ig; solvedGrid = sg;
                          Navigator.pushNamed(context, "/sudokuWidget");

                      },
                      child: Text(
                        "Easy",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 164, 75, 170),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Divider(
                    color: Color.fromARGB(255, 208, 53, 219),
                    thickness: 0.5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () => {
                        
                      },
                      child: Text(
                        "Medium",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 164, 75, 170),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Divider(
                    color: Color.fromARGB(255, 208, 53, 219),
                    thickness: 0.5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Hard",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 164, 75, 170),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
          child: Container(
            child: Center(
                child: Text(
              "New Game",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 164, 75, 170).withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Container(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/sudokuWidget");
          },
          child: Container(
            child: Center(
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 69, 66, 66).withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Container(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            print("Settings");
          },
          child: Container(
            child: Center(
                child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 69, 66, 66).withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ]),
    ));
  }
}
