import 'package:flutter/material.dart';

class card_title_description extends StatelessWidget {
  const card_title_description({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 0),
        child: ListTile(
          leading: Icon(Icons.album, size: 41),
          title: Text('Snapsuite'),
          subtitle: Text('Address will go here'),
        ),
      ),
    );
  }
}
