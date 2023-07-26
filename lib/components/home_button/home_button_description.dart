import 'package:flutter/material.dart';

class home_button_description extends StatelessWidget {
  final String buttonDescription;

  const home_button_description({super.key, required this.buttonDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
        child: Text(
          buttonDescription,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xB3FFFFFF),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
