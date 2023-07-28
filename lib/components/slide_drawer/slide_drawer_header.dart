import 'package:flutter/material.dart';
// import 'package:test_app/screens/open_jobs.dart';
// import 'package:test_app/screens/WebViewApp.dart';


class slide_drawer_header extends StatelessWidget {

  const slide_drawer_header({super.key});

  @override
  Widget build(BuildContext context) {

    return DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.purple.shade400,
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://example.com/user.png'),
      ),
      SizedBox(height: 10),
      Text(
        'John Doe',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      Text(
        'johndoe@email.com',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    ],
  ),
);
  }
}
