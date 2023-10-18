import 'package:bloc_sample/screens/cartListScreen.dart';
import 'package:bloc_sample/screens/productListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // rotes, gelen değere göre sayfalara yönlendirme yapar.
      routes: {
        "/": (BuildContext context) => const ProductListScreen(),
        "/cart": (BuildContext context) => const CartListScreen()
      },
      initialRoute: "/",// açılış sayfası- anasayfa anlamına gelir.--> "/" Bu ifadeden bahsediyoruz.
    );
  }
}
