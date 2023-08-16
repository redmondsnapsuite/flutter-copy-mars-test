import 'package:flutter/material.dart';
import '../card_title_description/card_title_description.dart';

class scrollable_list_card_title_description extends StatelessWidget {
  const scrollable_list_card_title_description({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Constrain height.
      child: ListView(children: const [
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
        card_title_description(),
      ]),
    );
  }
}
