import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../card_mage/card_with_image.dart';

class gallery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<gallery> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Column(
      children: [
        CarouselSlider(
          items: list.map((item) => CardWithImage(
                              backgroundImage: 'assets/images/construction-image.jpg',
                              date: 'August 17, 2023',
                              title: 'Title goes here',
                              description: 'Description will go here.',
                              buttonText: 'Click Me',
                              onPressed: () {
                                // Add your button click logic here
                              },
                            )).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.purple)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
