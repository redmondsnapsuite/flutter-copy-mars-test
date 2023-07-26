import 'package:flutter/material.dart';
import '../../components/home_button/home_button.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            home_button(
                              backGroundColor: Colors.blue,
                              buttonTitle: 'New Job',
                              buttonIcon: Icons.construction,
                              buttonDescription: 'Tap here to \ncreate a new job',
                            ),
                            home_button(
                              backGroundColor: Colors.purple,
                              buttonTitle: 'Open Jobs',
                              buttonIcon: Icons.engineering,
                              buttonDescription: 'Tap here to \nopen all jobs',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            home_button(
                              backGroundColor: Colors.purple,
                              buttonTitle: 'Open Jobs',
                              buttonIcon: Icons.engineering,
                              buttonDescription: 'Tap here to \nopen all jobs',
                            ),
                            home_button(
                              backGroundColor: Colors.purple,
                              buttonTitle: 'Open Jobs',
                              buttonIcon: Icons.engineering,
                              buttonDescription: 'Tap here to \nopen all jobs',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            home_button(
                              backGroundColor: Colors.purple,
                              buttonTitle: 'Open Jobs',
                              buttonIcon: Icons.engineering,
                              buttonDescription: 'Tap here to \nopen all jobs',
                            ),
                            home_button(
                              backGroundColor: Colors.purple,
                              buttonTitle: 'Open Jobs',
                              buttonIcon: Icons.engineering,
                              buttonDescription: 'Tap here to \nopen all jobs',
                            ),
                          ],
                        ),
                      ],
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
