import 'package:bloc_sample/models/product.dart';

class ProductService {
  static List <Product> product = <Product>[];

  // singleton design pattern
  static ProductService _singleton = ProductService._internal(); //Constructor çağrıldı.

  // Constructor yapılandırması. name Contructor'ı ProductService haline getirdik
  factory ProductService(){
    return _singleton;
  }
  ProductService._internal();// name constructor

  static List<Product> getAll(){
    product.add(Product(1, "Monster Laptop", 20000));
    product.add(Product(2, "Acer Laptop", 19000));
    product.add(Product(3, "Lenovo Laptop", 22000));
    return product;
  }
}