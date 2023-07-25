import 'package:flutter/material.dart';

class Square extends StatefulWidget {
  const Square({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontSize: 120,
      ),
    );
  }
}