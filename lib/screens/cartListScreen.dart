import 'package:bloc_sample/blocs/cartBloc.dart';
import 'package:flutter/material.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alışveriş Sitesi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 99, 185, 164),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: StreamBuilder(
        initialData: cartBloc.getCart(),
        stream: cartBloc.getStream,
        builder: (context, snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        var cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name),
          subtitle: Text(cart[index].product.price.toString()),
          trailing: IconButton(
            onPressed: () {
              cartBloc.removeFromCart(
                cart[index]
              );
            },
            icon: const Icon(Icons.remove_shopping_cart),
          ),
        );
      },
    );
  }
}
