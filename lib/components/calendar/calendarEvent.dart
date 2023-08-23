import 'package:flutter/material.dart';

class CalendarEvent extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;

  CalendarEvent({
    required this.iconData,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(1, 1, 1, 0),
        child: ListTile(
          leading: Icon(iconData, size: 41),
          title: Text(title),
          subtitle: Text(description),
        ),
      ),
    );
  }
}
