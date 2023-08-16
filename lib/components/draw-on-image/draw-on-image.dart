import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageEditorWidget extends StatefulWidget {
  @override
  _ImageEditorWidgetState createState() => _ImageEditorWidgetState();
}

class _ImageEditorWidgetState extends State<ImageEditorWidget> {
  File? _imageFile;
  List<List<Offset>> _lines = [];
  Color _drawColor = Colors.red; // Set the color to red

  Future<void> _selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
    }
  }

  Future<String> _getFilePath() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return '$appDocPath/drawn_image.png';
  }

  void _saveDrawnImage() async {
    String filePath = await _getFilePath();

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint()
      ..color = Colors.transparent
      ..blendMode = BlendMode.clear;
    final image = await loadImage();

    if (image != null) {
      canvas.drawImage(image, Offset.zero, paint);
      for (var line in _lines) {
        if (line.length > 1) {
          for (var i = 0; i < line.length - 1; i++) {
            canvas.drawLine(line[i], line[i + 1], paint);
          }
        }
      }
      canvas.save();
      canvas.restore();

      final picture = recorder.endRecording();
      final pngBytes = await picture.toImage(image.width, image.height);
      final byteData = await pngBytes.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        Uint8List pngData = byteData.buffer.asUint8List();
        final file = File(filePath);
        await file.writeAsBytes(pngData);
      }
    }
  }

  Future<ui.Image?> loadImage() async {
    if (_imageFile != null) {
      final bytes = await _imageFile!.readAsBytes();
      return decodeImageFromList(bytes);
    }
    return null;
  }

  void _onPanStart(DragStartDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(details.globalPosition);
    setState(() {
      _lines.add([localPosition]);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(details.globalPosition);
    setState(() {
      _lines.last.add(localPosition);
    });
  }

  void _clearDrawing() {
    setState(() {
      _lines.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Editor'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 100,
                    minHeight: 100,
                  ),
                  child: Stack(
                    children: [
                      _imageFile != null
                          ? Image.file(_imageFile!)
                          : Text(
                              'No image selected',
                              style: TextStyle(fontSize: 18.0),
                            ),
                      CustomPaint(
                        painter: _DrawingPainter(
                          lines: _lines,
                          drawColor: _drawColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: _selectImage,
              icon: Icon(Icons.image),
            ),
            IconButton(
              onPressed: _saveDrawnImage,
              icon: Icon(Icons.save),
            ),
            IconButton(
              onPressed: _clearDrawing,
              icon: Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<List<Offset>> lines;
  final Color drawColor;

  _DrawingPainter({
    required this.lines,
    required this.drawColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = drawColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    for (var line in lines) {
      if (line.length > 1) {
        for (var i = 0; i < line.length - 1; i++) {
          canvas.drawLine(line[i], line[i + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
