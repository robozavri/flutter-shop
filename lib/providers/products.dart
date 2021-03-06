import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      // isFavorite: false,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      // isFavorite: false,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      // isFavorite: true,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      // isFavorite: false,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // bool _showFavoritesOnly = false;

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((productItem) => productItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoritItems {
    // print('==================');
    // print(_items.where((productItem) {
    //   print('......................');
    //   print(productItem.isFavorite);
    //   print(productItem);
    //   print('......................');
    //   return productItem.isFavorite ? true : false;
    // }).toList());
    // var res = _items.map((productItem) {
    //   print('productItem');
    //   return productItem;
    // });
    // print(res);
    return _items.where((productItem) => productItem.id == 'p2').toList();
    // var res = items.where((productItem) => productItem.isFavorite == true);
    // return [...res];
    // return _items
    //     .where((productItem) => productItem.isFavorite == true)
    //     .toList();
    // return _items.where((productItem) => productItem.isFavorite).toList();
    // print('here getFavoritItems');
    // var it = _items.where((productItem) => productItem.isFavorite).toList();
    // log('data getFavoritItems: $it');
    // return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
