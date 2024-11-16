import 'package:flutter/material.dart';
import 'home_account_page.dart';
import 'home_cart_page.dart';
import 'home_categories_screen.dart';
import 'home_favorit2_page.dart';
import 'home_lungangen_page.dart';

class HomePageApple extends StatefulWidget {
  @override
  _HomePageAppleState createState() => _HomePageAppleState();
}

class _HomePageAppleState extends State<HomePageApple> {

  int selectedIndex = 0;
  List<String> categories = ['Fruits', 'Vegetables', 'Meat', 'Fish', 'Snacks'];
  List<String> cartItems = [];

  List<Map<String, dynamic>> products = [
    {'name': 'Red Apple', 'image': 'assets/images/Apple.png', 'oldPrice': 5.99, 'newPrice': 4.99, 'discount': 10},
    {'name': 'Banana', 'image': 'assets/images/Banana.png', 'oldPrice': 2.99, 'newPrice': 2.49, 'discount': 16},
    {'name': 'Grapes', 'image': 'assets/images/Grapes.png', 'oldPrice': 3.99, 'newPrice': 3.49, 'discount': 12},
    {'name': 'Mango', 'image': 'assets/images/Mango.png', 'oldPrice': 6.99, 'newPrice': 5.99, 'discount': 14},
    {'name': 'Sea- Bowl', 'image': 'assets/images/Bowl.png', 'oldPrice': 4.99, 'newPrice': 3.99, 'discount': 20},
    {'name': 'Lichi', 'image': 'assets/images/Chilli.png', 'oldPrice': 5.49, 'newPrice': 4.49, 'discount': 18},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits', style: TextStyle(fontSize: 18, color: Colors.orange)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.orange),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories
                  .asMap()
                  .entries
                  .map((entry) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = entry.key;
                  });
                },
                child: Text(
                  entry.value,
                  style: TextStyle(
                    fontSize: 12,
                    color: selectedIndex == entry.key ? Colors.orange : Colors.grey,
                    fontWeight: selectedIndex == entry.key ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ))
                  .toList(),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return ProductCard(
                    name: product['name'],
                    imagePath: product['image'],
                    oldPrice: product['oldPrice'],
                    newPrice: product['newPrice'],
                    discount: product['discount'],
                    onAddToCart: () {
                      setState(() {
                        cartItems.add(product['name']);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double oldPrice;
  final double newPrice;
  final int discount;
  final VoidCallback onAddToCart;

  ProductCard({
    required this.name,
    required this.imagePath,
    required this.oldPrice,
    required this.newPrice,
    required this.discount,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text("1kg", style: TextStyle(fontSize: 10, color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$$newPrice",
                          style: TextStyle(fontSize: 12, color: Colors.orange, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$$oldPrice",
                          style: TextStyle(fontSize: 10, color: Colors.grey, decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "-$discount%",
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      ),
                    ),
                    IconButton(
                      onPressed: onAddToCart,
                      icon: Icon(Icons.add_circle, color: Colors.green, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
