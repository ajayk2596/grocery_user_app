import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_user_app/controllers/provider/carts/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            return Text('My Cart (${cartProvider.counter})');
          },

        ),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: cartProvider.getCartItems(), // Updated method call
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data!'));
          }

          final cartItems = snapshot.data ?? [];

          if (cartItems.isEmpty) {
            return const Center(child: Text('No items in cart.'));
          }

          double totalPrice = 0;
          for (var item in cartItems) {
            totalPrice += (item['price'] ?? 0) * (item['quantity'] ?? 1);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {

                    final item = cartItems[index];
                    final int quantity = item['quantity'] ?? 1;

                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: item['thumbnail'] != null
                            ? Image.network(
                          item['thumbnail'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, size: 50),
                        )
                            : const Icon(Icons.image, size: 50),
                        title: Text(item['title'] ?? 'No Title'),
                        subtitle: Text(
                          'Price: \$${item['price'] ?? 0.0}\n'
                              'Quantity: $quantity\n'
                              'Total: \$${(item['price'] ?? 0) * quantity}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (quantity > 1) {
                                  FirebaseFirestore.instance
                                      .collection('carts')
                                      .doc(uid)
                                      .collection('userCart')
                                      .doc(item['id'])
                                      .update({'quantity': quantity - 1});
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('carts')
                                    .doc(uid)
                                    .collection('userCart')
                                    .doc(item['id'])
                                    .update({'quantity': quantity + 1});
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                cartProvider.addToCartDecrement();
                                FirebaseFirestore.instance
                                    .collection('carts')
                                    .doc(uid)
                                    .collection('userCart')
                                    .doc(item['id'])
                                    .delete()
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Item removed from cart.'),
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.orange[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Price:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
