import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_painter/image_painter.dart';
import 'package:open_file/open_file.dart';

class PainOnImageWidget extends StatefulWidget {
  @override
  _ImageEditorWidgetState createState() => _ImageEditorWidgetState();
}

class _ImageEditorWidgetState extends State<PainOnImageWidget> {
  File? _imageFile;
  String? _filePath;
  double? _imageWidth; // Add this line
  double? _imageHeight; // Add this line
  List<List<Offset>> _lines = [];
  Color _drawColor = Colors.red; // Set the color to red

  void initState() {
    super.initState();
    // _selectImage();
  }

  Future<void> _selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imageFile = File(result.files.single.path!);
        _filePath = result.files.single.path!;
        // print(result.files.single.path);
      });

      // After setting the image, decode it to get its size
      var image = await loadImage();
      if (image != null) {
        _imageWidth = image.width.toDouble();
        _imageHeight = image.height.toDouble();
      }
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
      final byteData =
          await pngBytes.toByteData(format: ui.ImageByteFormat.png);

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
      _filePath = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image Editor'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: ImagePainterExample(
                key: ValueKey(_filePath), imageFile: _filePath ?? ''),
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
            // IconButton(
            //   onPressed: _saveDrawnImage,
            //   icon: Icon(Icons.save),
            // ),
            // IconButton(
            //   onPressed: _clearDrawing,
            //   icon: Icon(Icons.clear),
            // ),
          ],
        ),
      ),
    );
  }
}

class ImagePainterExample extends StatefulWidget {
  final String imageFile;

  ImagePainterExample({Key? key, required this.imageFile}): super(key: key);

  @override
  _ImagePainterExampleState createState() => _ImagePainterExampleState();
}

class _ImagePainterExampleState extends State<ImagePainterExample> {
  final _imageKey = GlobalKey<ImagePainterState>();

  void saveImage() async {
    final image = await _imageKey.currentState?.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('$fullPath');
    if (image != null) {
      imgFile.writeAsBytesSync(image);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey[700],
          padding: const EdgeInsets.only(left: 10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Image Exported successfully.",
                  style: TextStyle(color: Colors.white)),
              TextButton(
                onPressed: () => OpenFile.open("$fullPath"),
                child: Text(
                  "Open",
                  style: TextStyle(
                    color: Colors.blue[200],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("asdasdasd");
    // print(widget.imageFile);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Painter Example"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: saveImage,
          )
        ],
      ),
      body: widget.imageFile == null || widget.imageFile.isEmpty
          ? ImagePainter.asset(
              'assets/images/sample.jpg',
              key: _imageKey,
              scalable: true,
              initialStrokeWidth: 5,
              textDelegate: TextDelegate(),
              initialColor: Colors.purple,
              initialPaintMode: PaintMode.freeStyle,
            )
          : ImagePainter.file(
              File(widget.imageFile),
              key: _imageKey,
              scalable: true,
              initialStrokeWidth: 5,
              textDelegate: TextDelegate(),
              initialColor: Colors.purple,
              initialPaintMode: PaintMode.freeStyle,
            ),
      // body: ImagePainter.asset(
      //   widget.imageFile,
      //   key: _imageKey,
      //   scalable: true,
      //   initialStrokeWidth: 2,
      //   textDelegate: TextDelegate(),
      //   initialColor: Colors.green,
      //   initialPaintMode: PaintMode.line,
      // ),
    );
  }
}
