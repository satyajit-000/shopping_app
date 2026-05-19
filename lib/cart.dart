import 'base_product.dart';

class Cart extends BaseProduct {
  final int size;

  const Cart({
    required this.size,
    required super.id,       // ✅ pass to parent via super
    required super.title,
    required super.price,
    required super.company,
    required super.imageUrl,
  });
}