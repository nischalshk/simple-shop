import 'package:flutter/material.dart';
import 'package:shop_state/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
     Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trous'),
  ];




//  final List<Product> loadedProducts = [
 
//   ];




  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
   // _items.add(value);
    notifyListeners();
  }
}
