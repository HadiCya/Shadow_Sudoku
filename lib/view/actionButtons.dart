import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key, required this.icon, required this.buttonText, this.onPressed})
      : super(key: key);

  final IconData icon;
  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.transparent;
                },
              ),
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: onPressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  String.fromCharCode(icon.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: icon.fontFamily,
                    package: icon.fontPackage,
                  ),
                ),
                Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            )));
  }
}
