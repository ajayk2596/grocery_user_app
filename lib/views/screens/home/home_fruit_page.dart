import 'package:flutter/cupertino.dart';
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
  int _currentIndex = 0;
  // Selected category
  int selectedIndex = 0;
  List<String> categories = ['Fruits', 'Vegetables', 'Meat', 'Fish', 'Snacks'];

  // List to hold cart items (can be changed according to logic)
  List<String> cartItems = [];

  // List of products (name, image, old price, new price, discount)
  List<Map<String, dynamic>> products = [
    {
      'name': 'Red Apple',
      'image': 'assets/images/Apple.png',
      'oldPrice': 5.99,
      'newPrice': 4.99,
      'discount': 10
    },
    {
      'name': 'Banana',
      'image': 'assets/images/Banana.png',
      'oldPrice': 2.99,
      'newPrice': 2.49,
      'discount': 16
    },
    {
      'name': 'Grapes',
      'image': 'assets/images/Grapes.png',
      'oldPrice': 3.99,
      'newPrice': 3.49,
      'discount': 12
    },
    {
      'name': 'Mango',
      'image': 'assets/images/Mango.png',
      'oldPrice': 6.99,
      'newPrice': 5.99,
      'discount': 14
    },
    {
      'name': 'Sea- Bowl',
      'image': 'assets/images/Bowl.png',
      'oldPrice': 4.99,
      'newPrice': 3.99,
      'discount': 20
    },
    {
      'name': 'Lichi',
      'image': 'assets/images/Chilli.png',
      'oldPrice': 5.49,
      'newPrice': 4.49,
      'discount': 18
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        leading: Icon(Icons.arrow_back, color: Colors.orange),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    color: selectedIndex == entry.key
                        ? Colors.orange
                        : Colors.grey,
                    fontWeight: selectedIndex == entry.key
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ))
                  .toList(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length, // Number of items
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Navigate to HomeAccountScreen when the "Account" button is clicked
          if (index == 4) {  // Index of the "Account" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeAccountScreen()),
            );
          }

          // Navigate to HomeFavoriteScreen when the "Favorite" button is clicked
          if (index == 3) {  // Index of the "Favorite" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeFavoriteScreenTwo()),
            );
          }

          if (index == 2) {  // Index of the "Favorite" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeCartPage()),
            );
          }

          if (index == 1) {  // Index of the "Favorite" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeCategoriesScreen()),
            );
          }

          if (index == 0) {  // Index of the "Favorite" button
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeLungungenPage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
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
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(  // Center widget to center the image
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,  // Image will be contained and centered
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text("1kg", style: TextStyle(color: Colors.grey)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$$newPrice",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$$oldPrice",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
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
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    IconButton(
                      onPressed: onAddToCart,
                      icon: Icon(Icons.add_circle, color: Colors.green),
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
