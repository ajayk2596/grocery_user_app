import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_account_page.dart';
import 'home_cart_page.dart';
import 'home_categories_screen.dart';
import 'home_lungangen_page.dart';

class HomeFavoriteScreenTwo extends StatefulWidget {
  @override
  _HomeFavoriteScreenTwoState createState() => _HomeFavoriteScreenTwoState();
}

class _HomeFavoriteScreenTwoState extends State<HomeFavoriteScreenTwo> {

  int _currentIndex = 0;
  // Sample data for favorite items
  List<Map<String, dynamic>> favoriteItems = [
    {
      'name': 'Red Apple',
      'price': '\$4.99',
      'unit': 'kg',
      'image': 'assets/images/Apple.png',
    },
    {
      'name': 'Salmon',
      'price': '\$50',
      'unit': 'kg',
      'image': 'assets/images/Salmon.png',
    },
    {
      'name': 'Avocado Bowl',
      'price': '\$24',
      'unit': 'st',
      'image': 'assets/images/Bowl.png',
    },
  ];

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
          'Favorite',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return Dismissible(
            key: Key(item['name']),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                favoriteItems.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item['name']} removed from favorites")),
              );
            },
            child: ListTile(
              leading: Image.asset(
                item['image'],
                width: 50,
                height: 50,
              ),
              title: Text(
                item['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.orange, size: 18),
                  SizedBox(width: 5),
                  Text("Add to cart", style: TextStyle(color: Colors.orange)),
                ],
              ),
              trailing: Text(
                "${item['price']} ${item['unit']}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
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