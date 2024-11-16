import 'package:flutter/material.dart';

import 'home_account_page.dart';
import 'home_categories_screen.dart';
import 'home_favorit2_page.dart';
import 'home_lungangen_page.dart';

class HomeCartPage extends StatefulWidget {
  @override
  _HomeCartPageState createState() => _HomeCartPageState();
}

class _HomeCartPageState extends State<HomeCartPage> {


  // Cart items with quantities and prices
  List<Map<String, dynamic>> cartItems = [
    {'name': 'Red Apple', 'image': 'assets/images/Apple.png', 'price': 4.99, 'quantity': 2, 'unit': 'kg'},
    {'name': 'Original Banana', 'image': 'assets/images/Banana.png', 'price': 5.99, 'quantity': 2, 'unit': 'kg'},
    {'name': 'Avocado Bowl', 'image': 'assets/images/Bowl.png', 'price': 24.00, 'quantity': 1, 'unit': 'st'},
    {'name': 'Salmon', 'image': 'assets/images/Salmon.png', 'price': 50.00, 'quantity': 2, 'unit': 'kg'},
    {'name': 'Lichi', 'image': 'assets/images/Chilli.png', 'price': 60.00, 'quantity': 2, 'unit': 'kg'},
  ];

  // Function to increase quantity
  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Function to decrease quantity
  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  // Calculate total price of all items in the cart
  double getTotalPrice() {
    return cartItems.fold(0, (total, item) => total + item['price'] * item['quantity']);
  }

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get screen dimensions
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03, // Dynamic horizontal padding
                    vertical: screenHeight * 0.01,  // Dynamic vertical padding
                  ),
                  child: Row(
                    children: [
                      // Responsive image size based on screen width
                      Container(
                        width: screenWidth * 0.2,
                        height: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover, // Ensures the image fits in the container
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04), // Dynamic spacing between image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05, // Dynamic font size
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => decreaseQuantity(index),
                                      icon: Icon(Icons.remove_circle_outline),
                                      iconSize: screenWidth * 0.07, // Dynamic icon size
                                    ),
                                    Text(
                                      '${item['quantity']}',
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.05, // Dynamic font size
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => increaseQuantity(index),
                                      icon: Icon(Icons.add_circle_outline),
                                      iconSize: screenWidth * 0.07, // Dynamic icon size
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.05, // Dynamic font size
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Checkout section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${getTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    // Perform checkout action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.3,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02), // Add spacing above the bottom navigation bar
        ],
      ),

    );
  }
}
