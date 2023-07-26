import 'package:flutter/material.dart';

class home_button_title extends StatelessWidget {
  final String buttonTitle;

  const home_button_title({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Text(buttonTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          )),
    );
  }
}
