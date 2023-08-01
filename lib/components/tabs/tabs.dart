import 'package:flutter/material.dart';
import '../card_title_description/card_title_description.dart';

class tabs extends StatelessWidget {
  const tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.purple,
          tabs: [
            Tab(icon: Icon(Icons.flight, color: Colors.purple)),
            Tab(icon: Icon(Icons.directions_transit, color: Colors.purple)),
            Tab(icon: Icon(Icons.directions_car, color: Colors.purple)),
          ],
        ),
        body: TabBarView(
          children: [
            card_title_description(),
            card_title_description(),
            card_title_description(),
          ],
        ),
      ),
    );
  }
}
