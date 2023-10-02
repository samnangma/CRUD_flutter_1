import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}
class _ImagePickerExampleState extends State<ImagePickerExample> {
  late File image;

  selectImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Example"),
      ),
      body: image == null
          ? Center(child: Text("Image Picker Example "))
          : Image.file(image),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectImage();
        },
        child: Icon(Icons.star),
      ),
    );
  }
}
