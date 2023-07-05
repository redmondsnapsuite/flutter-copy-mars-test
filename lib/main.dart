import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_test/screens/profile_screen.dart';
import 'package:mars_test/screens/user_screen.dart';
import 'package:mars_test/services/bloc/user_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: UserScreen(),
  //     routes: {
  //       'profile': (context) => ProfileScreen()
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(),
      child: MaterialApp(
        title: 'My App',
        home: UserScreen(),
      ),
    );
  }
}
