import 'package:flutter/material.dart';
// import '../../components/home_button/combined_home_button.dart';
import '../../components/button/button.dart';
import '../../components/home_button/home-button-mobile.dart';
import '../../components/input_field/input_field.dart';
import '../../components/scrollable_list/scrollable_list_card_title_description.dart';

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
                              buttonDescription:
                                  'Tap here to \ncreate a new job',
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
                  
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          button(buttonText: 'Submit', buttonColor: Colors.purple)
                        ])
                    ),
                    Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           input_field(inputHint: 'test hint'),
                        ])
                    ),
                     Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            scrollable_list_card_title_description(),
                          ])),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
