import 'package:crud_in_flutter/Homepage.dart';
import 'package:crud_in_flutter/image_picker.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerExample()
    );
  }
}




// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Upload Image'),
//         ),
//         body: Center(
//           child: UploadForm(),
//         ),
//       ),
//     );
//   }
// }

// class UploadForm extends StatefulWidget {
//   @override
//   _UploadFormState createState() => _UploadFormState();
// }

// class _UploadFormState extends State<UploadForm> {
//   final picker = ImagePicker();

//   String imagePath = '';

//   void _pickImage() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       setState(() {
//         imagePath = pickedImage.path;
//       });
//     }
//   }

//   Future<void> uploadImage() async {
//     if (imagePath.isNotEmpty) {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('https://cms.istad.co/api/upload'),
//       );
//       request.files.add(await http.MultipartFile.fromPath('files', imagePath));

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         print(await response.stream.bytesToString());
//       } else {
//         print(response.reasonPhrase);
//       }
//     } else {
//       print('No image selected');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ElevatedButton(
//             onPressed: _pickImage,
//             child: Text('Select Image'),
//           ),
//           SizedBox(height: 16.0),
//           if (imagePath.isNotEmpty)
//             Image.file(
//               File(imagePath),
//               height: 200.0,
//             ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             onPressed: uploadImage,
//             child: Text('Upload Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }