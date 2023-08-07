import 'package:flutter/material.dart';
import 'package:shadow_sudoku/view/sudokuWidget.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/sudokuWidget': (context) => SudokuWidget(),
    }, home: FrontPageHome());
  }
}

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
        Container(
          child: GestureDetector(
            onTap: () => (showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  child: ColoredBox(
                      color: const Color.fromARGB(255, 44, 43, 43),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () => (Navigator.pushNamed(
                                  context, "/sudokuWidget")),
                              child: Center(
                                  child: Text(
                                "Easy",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ),
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 164, 75, 170)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 25,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () => (Navigator.pushNamed(
                                  context, "/sudokuWidget")),
                              child: Center(
                                  child: Text(
                                "Medium",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ),
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 164, 75, 170)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 25,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () => (Navigator.pushNamed(
                                  context, "/sudokuWidget")),
                              child: Center(
                                  child: Text(
                                "Hard",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ),
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 164, 75, 170)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )),
                );
              },
            )),
            child: Center(
                child: Text(
              "New Game",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
          ),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 164, 75, 170).withOpacity(0.7),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          height: 15,
        ),
        Container(
          child: GestureDetector(
            onTap: () {
              print("Continue");
            },
            child: Center(
                child: Text(
              "Continue",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
          ),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 69, 66, 66).withOpacity(0.7),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Container(
          height: 15,
        ),
        Container(
          child: GestureDetector(
            onTap: () {
              print("Settings");
            },
            child: Center(
                child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            )),
          ),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 69, 66, 66).withOpacity(0.7),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ]),
    ));
  }
}
