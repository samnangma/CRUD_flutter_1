import 'package:crud_in_flutter/fetch_api.dart';
import 'package:crud_in_flutter/product_cart.dart';
import 'package:flutter/material.dart';

class Homepage  extends StatelessWidget {
  const Homepage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Product List'),
        ),
        body: FutureBuilder<List<Product>>(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Product product = snapshot.data![index];
                  return ProductCard(
                    name: product.name,
                    category: product.category,
                    discount: product.discount,
                    deliveryFee: product.deliveryFee,
                    deliveryTime: product.deliveryTime,
                    pictureUrl: product.pictureUrl,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
    );
  }
}