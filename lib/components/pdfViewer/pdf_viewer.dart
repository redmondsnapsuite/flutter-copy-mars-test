import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../layout/navBar.dart';

class PDFViewer extends StatelessWidget {
  final String pdfUrl;

  PDFViewer({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarWidget.navBar('PDF Viewer'),
      body: Padding(
        padding: EdgeInsets.only(top: 10), // Add 10 pixels top padding
        child: PDF().cachedFromUrl(
          pdfUrl,
          placeholder: (progress) => Center(child: CircularProgressIndicator()),
          errorWidget: (error) => Center(child: Text('Error loading PDF.')),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
            onPressed: () {
              Navigator.pop(context); // Close the PDF viewer
            },
            child: Text(
              'Close PDF',  
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
