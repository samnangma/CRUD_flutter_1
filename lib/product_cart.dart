import 'package:flutter/material.dart';
class ProductCard extends StatelessWidget {
  final String name;
  final String category;
  final int discount;
  final double deliveryFee;
  final int deliveryTime;
  final String pictureUrl;

  const ProductCard({super.key, 
    required this.name,
    required this.category,
    required this.discount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.pictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(pictureUrl),
          ListTile(
            title: Text(name),
            subtitle: Text(category),
          ),
          Text('Discount: $discount%'),
          Text('Delivery Fee: $deliveryFee'),
          Text('Delivery Time: $deliveryTime minutes'),
        ],
      ),
    );
  }
}
