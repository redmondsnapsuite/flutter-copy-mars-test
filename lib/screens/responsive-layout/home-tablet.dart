import 'package:flutter/material.dart';
import '../../components/home_button/tablet/home-button-tablet.dart';

class MyTabletBody extends StatelessWidget {
  const MyTabletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<double> data = [5, 7, 2, 8, 4];


    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: CustomGradientButton(
                      label: 'New Job',
                      icon: Icons.construction,
                      bigNumber: '1',
                      smallLabel: 'This week',
                      smallNumber: 0,
                      gradientColors: [Colors.purple[800]!, Colors.purple[400]!],
                      onTap: () {
                        // Handle the button tap here (if needed)
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    child: CustomGradientButton(
                      label: 'Open Jobs',
                      icon: Icons.engineering,
                      bigNumber: '42',
                      smallLabel: 'This week',
                      smallNumber: 3,
                      gradientColors: [Colors.blue[800]!, Colors.blue[400]!],
                      onTap: () {
                        // Handle the button tap here (if needed)
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    child: CustomGradientButton(
                      label: 'Another Job',
                      icon: Icons.work,
                      bigNumber: '15',
                      smallLabel: 'This week',
                      smallNumber: 1,
                      gradientColors: [Colors.orange[800]!, Colors.orange[400]!],
                      onTap: () {
                        // Handle the button tap here (if needed)
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    child: CustomGradientButton(
                      label: 'Red Button',
                      icon: Icons.error,
                      bigNumber: '99',
                      smallLabel: 'This week',
                      smallNumber: 5,
                      gradientColors: [Colors.red[800]!, Colors.red[400]!],
                      onTap: () {
                        // Handle the button tap here (if needed)
                      },
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
}
