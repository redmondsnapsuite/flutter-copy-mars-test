import 'package:flutter/material.dart';

class NavBarWidget {
  static navBar(String title) {
    return AppBar(
        backgroundColor: Colors.purple,
        title: Text(title),
        centerTitle: true,
        leading: const IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: click,
        ));
  }
}

void click() {
  // Navigator.pop(context, true);
}
