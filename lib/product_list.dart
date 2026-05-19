import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product.dart';
import 'package:shop_app_flutter/product_card.dart';
import 'package:shop_app_flutter/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String seletedFilter;
  late List<Product> filteredProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seletedFilter = filters[0];
    filteredProducts = filterProducts(
      products: products,
      filter: seletedFilter,
    );
  }

  List<Product> filterProducts({required List<Product> products, required String filter}) {
    if (filter == 'All') return products;
    return products.where((p) => p.company == filter).toList();
  }
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
            color: Color.fromRGBO(225, 225, 225, 1)
        ),
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50),
            right: Radius.circular(0)
        )
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollections',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          seletedFilter = filter;
                          filteredProducts = filterProducts(
                            products: products,
                            filter: seletedFilter,
                          );
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        backgroundColor: seletedFilter == filter ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                        side: BorderSide(
                          color: const Color.fromRGBO(245, 247, 249, 1),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(30)
                        ),
                        label: Text(filters[index], style: TextStyle(
                            fontWeight: seletedFilter == filter ? FontWeight.bold : FontWeight.normal
                        ),),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product)));
                    },
                    child: ProductCard(
                      product: product,
                      backgroundColor: (
                          index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1)
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
