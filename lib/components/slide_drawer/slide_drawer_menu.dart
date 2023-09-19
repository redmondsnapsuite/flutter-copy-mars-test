import 'package:flutter/material.dart';
import '../../screens/open_jobs.dart';
// import 'package:test_app/screens/WebViewApp.dart';

class slide_drawer_menu extends StatelessWidget {
  final String? title;
 final VoidCallback? onTap;

  const slide_drawer_menu({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(title ?? 'Open Jobs'),
        onTap: onTap ?? () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const open_jobs()))
        },
      ),
    );
  }
}
