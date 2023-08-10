import 'package:flutter/material.dart';
import '../card_title_description/card_title_description.dart';

class tabs extends StatelessWidget {
  const tabs({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          indicator: BoxDecoration(
            color: Colors.purple[100],  // Gray background for active tab
          ),
          indicatorColor: Colors.purple,
          tabs: [
            Tab(
              child: Text(
                'Flight',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,  // Increased font size
                  fontWeight: FontWeight.bold,  // Added font weight
                ),
              ),
            ),
            Tab(
              child: Text(
                'Transit',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,  // Increased font size
                  fontWeight: FontWeight.bold,  // Added font weight
                ),
              ),
            ),
            Tab(
              child: Text(
                'Car',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,  // Increased font size
                  fontWeight: FontWeight.bold,  // Added font weight
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Flight Container',
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    ),
                    card_title_description(),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Transit Container',
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    ),
                    card_title_description(),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Car Container',
                      style: TextStyle(color: Colors.purple, fontSize: 18),
                    ),
                    card_title_description(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
