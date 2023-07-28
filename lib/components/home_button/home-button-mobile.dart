import 'package:flutter/material.dart';

class home_button_icon extends StatelessWidget {
  final IconData buttonIcon;

  const home_button_icon({Key? key, required this.buttonIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Icon(
        buttonIcon,
        color: Colors.white,
        size: 44,
      ),
    );
  }
}

class home_button_title extends StatelessWidget {
  final String buttonTitle;

  const home_button_title({Key? key, required this.buttonTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
      child: Text(buttonTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          )),
    );
  }
}

class home_button_description extends StatelessWidget {
  final String buttonDescription;

  const home_button_description({Key? key, required this.buttonDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
        child: Text(
          buttonDescription,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xB3FFFFFF),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class home_button extends StatelessWidget {
  final Color backGroundColor;
  final String buttonTitle;
  final IconData buttonIcon;
  final String buttonDescription;

  const home_button({
    Key? key,
    required this.backGroundColor,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.buttonDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => open_jobs()))
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
              home_button_description(buttonDescription: buttonDescription),
            ],
          ),
        ),
      ),
    );
  }
}
