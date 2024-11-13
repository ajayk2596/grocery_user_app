import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Address/address.dart';
import '../orders/ordred.dart';
import 'home_cart_page.dart';
import 'home_categories_screen.dart';
import 'home_favorit2_page.dart';
import 'home_lungangen_page.dart';
import 'home_order_page.dart';
import 'home_pament_page.dart';
import 'home_profile_page.dart';

class HomeAccountScreen extends StatefulWidget {
  @override
  _HomeAccountScreenState createState() => _HomeAccountScreenState();
}

class _HomeAccountScreenState extends State<HomeAccountScreen> {

  int  _currentIndex = 0;
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsPage() ,));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.orange),
            title: Text(
              'Orders',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Ordered() ,));

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.orange),
            title: Text(
              'Address',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Address() ,));

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.orange),
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen() ,));

            },
          ),
        ],
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