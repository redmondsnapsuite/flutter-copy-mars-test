import 'package:flutter/material.dart';

class home_button_icon extends StatelessWidget {
  final IconData buttonIcon;

  const home_button_icon({super.key, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Icon(
        buttonIcon,
        color: Colors.white,
        size: 44,
      ),
    );
  }
}
