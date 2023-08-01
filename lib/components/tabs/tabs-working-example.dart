import 'package:flutter/material.dart';
// import '../card_title_description/card_title_description.dart';

class tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
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
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}
