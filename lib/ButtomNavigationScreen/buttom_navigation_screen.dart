import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/views/screens/change_password_screen/account.dart';
import 'package:grocery_user_app/views/screens/change_password_screen/cart.dart';
import 'package:grocery_user_app/views/screens/change_password_screen/explore.dart';
import 'package:grocery_user_app/views/screens/change_password_screen/favorite.dart';
import 'package:grocery_user_app/views/screens/change_password_screen/shop.dart';


class ButtonNavigationScreen extends StatefulWidget {
  const ButtonNavigationScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ButtonNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [

    HomeLungungenPage(),
    HomeCategoriesScreen(),
    HomeScreenCartDelet(),
    FavoritePage(),
    Account(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Add this line for better visibility
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey[300], // Light grey background for better contrast
        elevation: 2,
        onTap: _onItemTapped,
      ),

     );
  }
}

