import 'package:flutter/material.dart';
import '../../screens/open_jobs.dart';
// import 'package:test_app/screens/WebViewApp.dart';


class slide_drawer_menu extends StatelessWidget {

  const slide_drawer_menu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
        child:  ListTile(
              leading: Icon(Icons.person),
            title: Text('Open Jobs'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const open_jobs()))
            },
          ),
      );
  }
}
