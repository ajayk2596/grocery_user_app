import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFavoriteScreenTwo extends StatefulWidget {
  @override
  _HomeFavoriteScreenTwoState createState() => _HomeFavoriteScreenTwoState();
}

class _HomeFavoriteScreenTwoState extends State<HomeFavoriteScreenTwo> {
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
        currentIndex: 3, // Index for the "Favorite" tab
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