import 'dart:async';

import 'package:bloc_sample/data/productService.dart';
import 'package:bloc_sample/models/product.dart';

class ProductBloc {
  final productStreamController = StreamController.broadcast();
  Stream get getStream => productStreamController.stream;

  List<Product> getAll() {
    return ProductService.getAll();
  }
}

// Singleton yapısı kuruldu. Bir referans oluşturuldu ve bu referans sayesinde tüm sistemde erişim sağladı. 
final productBloc = ProductBloc();