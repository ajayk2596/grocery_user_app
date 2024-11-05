import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAccountSreen extends StatefulWidget {
  @override
  _HomeAccountSreenState createState() => _HomeAccountSreenState();
}

class _HomeAccountSreenState extends State<HomeAccountSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Account',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.orange),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.orange),
            title: Text(
              'Orders',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.orange),
            title: Text(
              'Address',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.orange),
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Index for the "Account" tab
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}