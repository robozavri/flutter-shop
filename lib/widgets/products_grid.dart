// import 'dart:convert';
// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context, listen: true);
    final productsData = Provider.of<Products>(context, listen: false);
    // final products = showFavs ? productsData.favoritItems : productsData.items;
    // final products = productsData.favoritItems;
    final products = productsData.items;
    // print('-------------');
    // print(showFavs);
    // print(products);
    // print(products.length);
    // print('-------------');
    // return Text('test');
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        // create: (c) {
        //   print('*****************');
        //   print(products);
        //   print(products[i]);
        //   // inspect(products[i]);
        //   return products[i];
        // },
        create: (c) => products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
