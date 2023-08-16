import 'package:flutter/material.dart';

class NavBarWidget {
  static navBar(String title, {VoidCallback? onPress}) {
    return AppBar(
        backgroundColor: Colors.purple,
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: onPress,
        ));
  }
}

void click() {
  // Navigator.pop(context, true);
}
