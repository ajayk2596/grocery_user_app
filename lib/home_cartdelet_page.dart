import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenCartDelet extends StatefulWidget {
  @override
  _HomeScreenCartDeletState createState() => _HomeScreenCartDeletState();
}

class _HomeScreenCartDeletState extends State<HomeScreenCartDelet> {
  int _currentIndex = 0;

  // Quantity states for each item
  int appleQty = 2;
  int bananaQty = 2;
  int avocadoQty = 1;
  int salmonQty = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.orange,
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                cartItem('Red Apple', 'assets/images/Apple.png', appleQty, '4,99 kg', () {
                  setState(() {
                    if (appleQty > 1) appleQty--;
                  });
                }, () {
                  setState(() {
                    appleQty++;
                  });
                }),
                cartItem('Original Banana', 'assets/images/Banana.png', bananaQty, '5,99 kg', () {
                  setState(() {
                    if (bananaQty > 1) bananaQty--;
                  });
                }, () {
                  setState(() {
                    bananaQty++;
                  });
                }),
                cartItem('Avocado Bowl', 'assets/images/Bowl.png', avocadoQty, '24 st', () {
                  setState(() {
                    if (avocadoQty > 1) avocadoQty--;
                  });
                }, () {
                  setState(() {
                    avocadoQty++;
                  });
                }),
                cartItem('Salmon', 'assets/images/Salmon.png', salmonQty, '50 kg', () {
                  setState(() {
                    if (salmonQty > 1) salmonQty--;
                  });
                }, () {
                  setState(() {
                    salmonQty++;
                  });
                }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              ),
              child: Text(
                'CheckOut',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // This controls the selected tab index
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index when tapped
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget cartItem(String name, String imgPath, int qty, String price, VoidCallback onRemove, VoidCallback onAdd) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imgPath,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: onRemove,
                        ),
                        Text(
                          '$qty',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: onAdd,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}