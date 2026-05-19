import 'package:flutter/material.dart';
import 'package:shop_app_flutter/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Color backgroundColor;
  const ProductCard({super.key, required this.product, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 5,),
          Text('\$${product.price}', style: Theme.of(context).textTheme.bodySmall,),
          SizedBox(height: 5,),
          Center(
            child: Image.asset(
              product.imageUrl,
              height: 170,
            ),
          ),
        ],
      ),
    );
  }
}
