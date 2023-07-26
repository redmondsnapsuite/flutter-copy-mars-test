import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String bigNumber;
  final String smallLabel;
  final int smallNumber;
  final List<Color> gradientColors;
  final Function()? onTap;

  const CustomGradientButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.bigNumber,
    required this.smallLabel,
    required this.smallNumber,
    required this.gradientColors,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 20), // Equal padding on left and right
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x37000000),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns the columns to the left and right
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 56,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center, // Aligns the middle column to the center
                children: [
                  Text(
                    bigNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center, // Aligns the third column to the center
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$smallLabel - $smallNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
