import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class Product {

  final String name;
  final String category;
  final int discount;
  final double deliveryFee;
  final int deliveryTime;
  final String pictureUrl;

  Product({
    required this.name,
    required this.category,
    required this.discount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.pictureUrl,
  });
}

Future<List<Product>> fetchProducts() async {
  final response = await http.get(
      Uri.parse('https://cms.istad.co/api/food-panda-restaurants?populate=*'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final productsData = jsonData['data'] as List<dynamic>;

    List<Product> products = productsData.map((productData) {
      final pictureData = productData['attributes']['picture'] != null
          ? productData['attributes']['picture']['data']
          : null;

      final pictureUrl =
          pictureData != null && pictureData['attributes'] != null
              ? pictureData['attributes']['url']
              : null;

      final imageUrl =
          pictureUrl != null ? 'https://cms.istad.co$pictureUrl' : '';
      return Product(
        name: productData['attributes']['name'],
        category: productData['attributes']['category'],
        discount: productData['attributes']['discount']?.toInt() ?? 0,
        deliveryFee:
            productData['attributes']['deliveryFee']?.toDouble() ?? 0.0,
        deliveryTime: productData['attributes']['deliveryTime']?.toInt() ?? 0,
        pictureUrl: imageUrl,
      );
    }).toList();

    return products;
  } else {
    throw Exception('Failed to fetch products');
  }
}