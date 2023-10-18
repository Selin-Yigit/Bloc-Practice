import 'dart:async';

import 'package:bloc_sample/data/cartService.dart';
import 'package:bloc_sample/models/cart.dart';

class CartBloc {
  // Asenkron yapı. Bir akış bulunur istenen işlem tamamlandıktan sonra birden fazla kez çalışabilir. Future da tek çalışır.
  final cartStreamController =
      StreamController.broadcast(); // stream başlatıldı.
  Stream get getStream => cartStreamController.stream;

  // İstenen işelmi servise iletebilmek için böyle bir fonksiyon yazdık. Çünkü UI, bloc'a ulaşır. Bloc Servise iletir.
  // Service <--> Bloc <--> UI
  void addToCart(Cart item) {
    CartService.AddToCart(item);
    // Bu event'in (CartService.getCart()) uygulandığı yerleri yeniden buil ederek broadcast'i güncelledik.
    // sink stream'i yeniden çalıştıran şey. Stream aralıklı olarak çalışır. Biz bir işlem yaptığımızda yeniden stream'i çalıştırıp gerekli
    //yerlerin yeniden build edilerek güncellemesini sağlamalıyız.
    cartStreamController.sink.add(CartService.getCart());
  }

  void removeFromCart(Cart item){
    CartService.RemoveFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }
}
// Singleton yapısı kuruldu. Bir referans oluşturuldu ve bu referans sayesinde tüm sistemde erişim sağladı. 
final cartBloc = CartBloc();