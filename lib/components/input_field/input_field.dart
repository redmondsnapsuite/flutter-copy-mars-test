import 'package:flutter/material.dart';

class input_field extends StatelessWidget {
  final String inputHint;

  const input_field({super.key, required this.inputHint});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
        child: TextFormField(
          obscureText: false,
          decoration: InputDecoration(
            labelText: inputHint,
            labelStyle: const TextStyle(color: Color(0xFF5D2483)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF5D2483),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF5D2483),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: false,
            // fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
          ),
          // style: FlutterFlowTheme.of(context).bodyText1,
        ),
      ),
    );
  }
}
