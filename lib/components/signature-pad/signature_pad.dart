import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

import '../../../layout/navBar.dart';

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  final GlobalKey<SignatureState> _signaturePadKey = GlobalKey<SignatureState>();
  final GlobalKey _containerKey = GlobalKey();

  Future<Uint8List?> _captureSignature() async {
    final boundary = _containerKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    if (byteData != null) {
      return byteData.buffer.asUint8List();
    }
    return null;
  }

  void _clearSignature() {
    _signaturePadKey.currentState!.clear();
  }

  void _closeSignaturePad() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarWidget.navBar('Signature Pad', onPress: _closeSignaturePad),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Card(
                margin: EdgeInsets.all(16.0),
                color: Colors.white,
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: RepaintBoundary(
                    key: _containerKey,
                    child: Signature(
                      color: Colors.black, // Color of the drawing path
                      strokeWidth: 5.0, // Width of the drawing path
                      backgroundPainter: null, // Additional custom painter to draw stuff like watermark
                      onSign: () {}, // Callback called on user pan drawing
                      key: _signaturePadKey, // Key that allows you to retrieve the image once the user has signed
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                    primary: Colors.purple[600],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
                onPressed: () async {
                  final signature = await _captureSignature();
                  // Handle the signature data as needed (e.g., save to a file, send to a server, etc.)
                  if (signature != null) {
                    // Signature available as Uint8List
                    // Do something with the signature
                    print('Signature captured!');
                  } else {
                    // Signature is empty
                    print('Signature is empty!');
                  }
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: _clearSignature,
                child: Text('Clear'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[600],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
              ),
              ElevatedButton(
                onPressed: _closeSignaturePad,
                child: Text('Close'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.red[600],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
