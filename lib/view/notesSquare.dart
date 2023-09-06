import 'package:flutter/material.dart';


class NotesSquare extends StatefulWidget {
  const NotesSquare({super.key, required this.notes});
  final List<bool> notes;

  @override
  State<NotesSquare> createState() => _NotesSquareState();
}

class _NotesSquareState extends State<NotesSquare> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(1),
            width: 10.0,
            height: 10.0,
            child: FittedBox(
                fit: BoxFit.none,
                child: Text(
                  widget.notes[index] ? "${index+1}" : " ",
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 10,
                  ),
                )));
      },
    );
  }
}
