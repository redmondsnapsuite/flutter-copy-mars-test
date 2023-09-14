import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

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
        final inputImage = InputImage.fromFilePath(image.path);
        final textDetector = GoogleMlKit.vision.textRecognizer();
        final RecognizedText recognisedText = await textDetector.processImage(inputImage);
        
        String scannedText = '';

        for (TextBlock block in recognisedText.blocks) {
          scannedText += block.text + '\n';
        }

        // Process the scanned text to extract credit card information
        // You need to implement logic to parse and extract card details

        setState(() {
          _scannedCardData = scannedText;
        });

        textDetector.close();
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
