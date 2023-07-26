import 'package:flutter/material.dart';
import 'package:mars_test/screens/responsive-layout/responsive-layout.dart';

import 'home-mobile.dart';
import 'home-tablet.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const MyMobileBody(),
        desktopBody: const MyTabletBody(),
      ),
    );
  }
}