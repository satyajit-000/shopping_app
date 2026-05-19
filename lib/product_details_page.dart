import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/cart_provider.dart';
import 'package:shop_app_flutter/product.dart';

class ProductDetailsPage  extends StatefulWidget {
  final Product product;
  const ProductDetailsPage ({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      bool isAdded = Provider.of<CartProvider>(context, listen: false).addProducts(widget.product, selectedSize);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          isAdded ? 'Product added successfully' : 'Item already exists in cart'
      )));
      setState(() {

      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a size')));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // selectedSize = widget.product.sizes[0];
  }

  bool getIsProductExistsInCart(int size) {
    return Provider.of<CartProvider>(context, listen: false).isExists(widget.product.id, size);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Image.asset(widget.product.imageUrl, height: 500,),
            Spacer(),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('\$${widget.product.price}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product.sizes.length,
                      itemBuilder: (context, index) {
                        final size = widget.product.sizes[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                backgroundColor: selectedSize == size ? Theme.of(context).colorScheme.primary : null,
                                label: Text(
                                  size.toString(),
                                ),
                              ),
                            ),
                          );
                        })
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton.icon(
                      onPressed: getIsProductExistsInCart(selectedSize) ? null : onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      icon: Icon(Icons.shopping_cart, color: Colors.black,),
                      label: Text(
                        getIsProductExistsInCart(selectedSize) ? 'Added to cart' : 'Add to cart',
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
