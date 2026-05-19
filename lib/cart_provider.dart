import 'package:flutter/cupertino.dart';
import 'package:shop_app_flutter/cart.dart';
import 'package:shop_app_flutter/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> cart = [];

  bool isExists(String id, int size) {
    return cart.any((item) => item.id == id && item.size == size);
  }

  bool addProducts(Product product, int size) {
    if(isExists(product.id, size)) {
      return false;
    }

    final cartItem = Cart(
      id: product.id,
      price: product.price,
      company: product.company,
      imageUrl: product.imageUrl,
      title: product.title,
      size:size,
    );
    cart.add(cartItem);
    notifyListeners();
    return true;
  }

  void removeProduct(String id) {
    cart.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}