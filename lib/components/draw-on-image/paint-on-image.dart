// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_painter/image_painter.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../layout/navBar.dart';

// // https://pub.dev/packages/image_painter
// class ImagePainterExample extends StatefulWidget {
//   @override
//   _ImagePainterExampleState createState() => _ImagePainterExampleState();
// }

// class _ImagePainterExampleState extends State<ImagePainterExample> {
//   final _imageKey = GlobalKey<ImagePainterState>();
//   final _key = GlobalKey<ScaffoldState>();

//   void saveImage() async {
//     final image = await _imageKey.currentState?.exportImage();
//     final directory = (await getApplicationDocumentsDirectory()).path;
//     await Directory('$directory/sample').create(recursive: true);
//     final fullPath =
//         '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
//     final imgFile = File('$fullPath');
//     imgFile.writeAsBytesSync(image!);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.grey[700],
//         padding: const EdgeInsets.only(left: 10),
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text("Image Exported successfully.",
//                 style: TextStyle(color: Colors.white)),
//             TextButton(
//               onPressed: () => OpenFile.open("$fullPath"),
//               child: const Text(
//                 "Open",
//                 style: TextStyle(
//                   color: Colors.purple,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       appBar: NavBarWidget.navBar('Image Editor'),

//       body: ImagePainter.asset(
//         "assets/images/sample.jpg",
//         key: _imageKey,
//         scalable: true,
//         initialStrokeWidth: 3,
//         initialColor: Colors.red,
//         initialPaintMode: PaintMode.freeStyle,
//       ),

//       bottomNavigationBar: BottomAppBar(
//         child:Padding(
//         padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//         child: ElevatedButton(
//                 onPressed: saveImage,
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.purple,
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                   ),
//                 child: const Text('Done'),
//               ),),


//       )
//     );
//   }
// }
