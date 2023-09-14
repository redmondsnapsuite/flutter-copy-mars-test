import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class CreditCardScanner extends StatefulWidget {
  @override
  _CreditCardScannerState createState() => _CreditCardScannerState();
}

class _CreditCardScannerState extends State<CreditCardScanner> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  String _scannedCardData = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(camera, ResolutionPreset.medium);
    await _cameraController!.initialize();

    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _scanCreditCard() async {
    try {
      final image = await ImagePicker().getImage(source: ImageSource.camera);

      if (image != null) {
        final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(File(image.path));
        final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

        final VisionText visionText = await textRecognizer.processImage(visionImage);
        String scannedText = '';

        for (TextBlock block in visionText.blocks) {
          scannedText += block.text + '\n';
        }

        // Process the scanned text to extract credit card information
        // You need to implement logic to parse and extract card details

        setState(() {
          _scannedCardData = scannedText;
        });

        textRecognizer.close();
      }
    } catch (e) {
      print('Error scanning credit card: $e');
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isCameraInitialized
            ? SizedBox(
                width: 300,
                height: 300,
                child: CameraPreview(_cameraController!),
              )
            : CircularProgressIndicator(),
        ElevatedButton(
          onPressed: _scanCreditCard,
          child: Text('Scan Credit Card'),
        ),
        Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_scannedCardData),
          ),
        ),
      ],
    );
  }
}
