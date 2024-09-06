import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final List<Map<String, String>> cartItems;

  const Cart({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              cartItems[index]['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(cartItems[index]['name']!),
            subtitle: Text('Quantity: ${cartItems[index]['quantity']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (int.parse(cartItems[index]['quantity']!) > 1) {
                      cartItems[index]['quantity'] =
                          (int.parse(cartItems[index]['quantity']!) - 1).toString();
                    } else {
                      cartItems.removeAt(index);
                    }
                    (context as Element).reassemble();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    cartItems[index]['quantity'] =
                        (int.parse(cartItems[index]['quantity']!) + 1).toString();
                    (context as Element).reassemble();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
