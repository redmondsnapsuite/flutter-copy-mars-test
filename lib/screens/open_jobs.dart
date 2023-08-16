import 'package:flutter/material.dart';
import '../components/tabs/tabs.dart';
import '../layout/footer.dart';
import '../layout/navBar.dart';

class open_jobs extends StatelessWidget {
  const open_jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavBarWidget.navBar('Next screen'),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(""),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: const tabs()),
        bottomNavigationBar: const FooterWidget() 
      );
  
  }
}
