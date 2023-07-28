import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Container(
        padding: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:50),
                  child: Column(
                    children: [
                      _buildIconButton(
                        icon: Icons.edit,
                        iconSize: 25,
                        iconColor: Colors.purple,
                        onPressed: () {},
                      ),
                      const Text(
                        'Signature',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 109, 109),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:50),
                  child: Column(
                    children: [
                      _buildIconButton(
                        icon: Icons.camera_alt,
                        iconSize: 25,
                        iconColor: Colors.purple,
                        onPressed: () {},
                      ),
                      const Text(
                        'Capture',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 109, 109, 109),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: -25,
              left: MediaQuery.of(context).size.width / 2 - (25 + 20) / 2,
              child: Column(
                children: [
                  _buildIconButton(
                    icon: Icons.mic,
                    iconSize: 25,
                    iconColor: Colors.white,
                    backgroundColor: Colors.purple,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 10),
                  const Text(
                  'Notes',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 109, 109, 109),
                    ),
                  ),
          ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required double iconSize,
    required Color iconColor,
    Color? backgroundColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: iconSize + 20,
      width: iconSize + 20,
      decoration: backgroundColor != null
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            )
          : const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
      child: IconButton(
        icon: SizedBox(
          height: 20, 
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

