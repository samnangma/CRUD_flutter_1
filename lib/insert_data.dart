 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class InsertForm extends StatefulWidget {
  @override
  _InsertFormState createState() => _InsertFormState();
}

class _InsertFormState extends State<InsertForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _deliveryFeeController = TextEditingController();
  final TextEditingController _deliveryTimeController = TextEditingController();
  final TextEditingController _pictureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: 'Category'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _discountController,
            decoration: InputDecoration(labelText: 'Discount'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _deliveryFeeController,
            decoration: InputDecoration(labelText: 'Delivery Fee'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _deliveryTimeController,
            decoration: InputDecoration(labelText: 'Delivery Time'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _pictureController,
            decoration: InputDecoration(labelText: 'Picture'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              insertPost();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Future<void> insertPost() async {
    EasyLoading.show(status: 'Loading...'); // Show loading overlay

    var headers = {
      'Content-Type': 'application/json',
    };

    // Get user input from controllers
    String name = _nameController.text;
    String category = _categoryController.text;
    int discount = int.parse(_discountController.text);
    double deliveryFee = double.parse(_deliveryFeeController.text);
    int deliveryTime = int.parse(_deliveryTimeController.text);
    String picture = _pictureController.text;

    var request = http.Request(
      'POST',
      Uri.parse('https://cms.istad.co/api/food-panda-restaurants'),
    );
    request.body = json.encode({
      "data": {
        "name": name,
        "category": category,
        "discount": discount,
        "deliveryFee": deliveryFee,
        "deliveryTime": deliveryTime,
        "picture": picture
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    EasyLoading.dismiss(); // Hide loading overlay

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      EasyLoading.showToast('Post inserted successfully');
    } else {
      print(response.reasonPhrase);
      EasyLoading.showError('Failed to insert post');
    }
  }
}