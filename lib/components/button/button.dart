import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const button(
      {super.key, required this.buttonText, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {},
        child: Text(buttonText),
      ),
    );
  }
}
