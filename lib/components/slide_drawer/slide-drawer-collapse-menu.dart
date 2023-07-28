import 'package:flutter/material.dart';

class CollapsibleListTile extends StatefulWidget {
  const CollapsibleListTile({Key? key}) : super(key: key);

  @override
  _CollapsibleListTileState createState() => _CollapsibleListTileState();
}

class _CollapsibleListTileState extends State<CollapsibleListTile> {
  bool _isExpanded = true;
  Color _expandedColor = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpansionTile(
            leading: Icon(Icons.home),
            title: Text('Parent Menu'),
            children: [
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Sub Menu 1'),
                onTap: () {
                  // Do something when the user taps on this list item.
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Sub Menu 2'),
                onTap: () {
                  // Do something when the user taps on this list item.
                },
              ),
            ],
            trailing: Icon(Icons.expand_more),
            textColor: _isExpanded ? _expandedColor : null,
            iconColor: _isExpanded ? _expandedColor : null,
            onExpansionChanged: (isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
          ),
        ],
      ),
    );
  }
}
