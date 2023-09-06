import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerComponent extends StatefulWidget {
  @override
  _FilePickerComponentState createState() => _FilePickerComponentState();
}

class _FilePickerComponentState extends State<FilePickerComponent> {
  List<File> _selectedFiles = [];

  Future<void> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.paths.map((path) => File(path!)));
      });
    }
  }

  String _formatBytes(int bytes) {
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    int i = 0;
    double fileSize = bytes.toDouble();
    while (fileSize >= 1024 && i < units.length - 1) {
      fileSize /= 1024;
      i++;
    }
    return '${fileSize.toStringAsFixed(2)} ${units[i]}';
  }

  Icon _getFileIcon(String extension) {
    if (extension == 'pdf') {
      return Icon(
        Icons.picture_as_pdf,
        size: 48,
        color: Colors.purple,
      );
    } else if (extension == 'png' || extension == 'jpg') {
      return Icon(
        Icons.image,
        size: 48,
        color: Colors.purple,
      );
    } else {
      return Icon(
        Icons.insert_drive_file,
        size: 48,
        color: Colors.purple,
      );
    }
  }

  Widget _buildFileCard(File file) {
    String fileName = file.path.split('/').last;
    String fileSize = _formatBytes(file.lengthSync());
    String fileExtension = fileName.split('.').last;

    return Card(
      color: Colors.white,
      child: ListTile(
        leading: _getFileIcon(fileExtension),
        title: Text(
          fileName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text('Type: $fileExtension'),
            SizedBox(width: 8),
            Text('Date: ${DateTime.now().toString().split(' ')[0]}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload a File',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (_selectedFiles.isNotEmpty)
              Column(
                children: _selectedFiles.map((file) => _buildFileCard(file)).toList(),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('Choose File'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
