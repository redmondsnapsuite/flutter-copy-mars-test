import 'package:flutter/material.dart';
// import 'package:test_app/screens/open_jobs.dart';
// import 'package:test_app/screens/WebViewApp.dart';
import './home_button_icon.dart';
import './home_button_title.dart';
import './home_button_description.dart';

class home_button extends StatelessWidget {
  final Color backGroundColor;
  final String buttonTitle;
  final IconData buttonIcon;
  final String buttonDescription;

  const home_button(
      {super.key,
      required this.backGroundColor,
      required this.buttonTitle,
      required this.buttonIcon,
      required this.buttonDescription});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => open_jobs()))
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: 150,
          decoration: BoxDecoration(
            color: backGroundColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x37000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              home_button_icon(buttonIcon: buttonIcon),
              home_button_title(buttonTitle: buttonTitle),
              home_button_description(buttonDescription: buttonDescription)
            ],
          ),
        ),
      ),
    );
  }
}
