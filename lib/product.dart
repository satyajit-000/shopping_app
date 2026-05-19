import 'base_product.dart';

class Product extends BaseProduct {
  final List<int> sizes;

  const Product({
    required this.sizes,
    required super.id,       // ✅ pass to parent via super
    required super.title,
    required super.price,
    required super.company,
    required super.imageUrl,
  });
}
