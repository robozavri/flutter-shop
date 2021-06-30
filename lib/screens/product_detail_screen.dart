import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    // რამდენი Products items შეიცვლება (წაიშლება ან დაემატება და განახლდება შიგნით რამე იმდენი აქ ხელახლა გაუშვებს widget run )
    // რაც არ გვჭირდება იმიტორო უბრალოდ უნდა მოვძებნოთ და გამოვიტანოთ კონკრეტული პროდუქტი. ამიტომ  listen: false, დავაყენოთ devault true ზე არის
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
