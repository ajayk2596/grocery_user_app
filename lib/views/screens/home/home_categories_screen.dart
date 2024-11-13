import 'package:flutter/material.dart';

import 'home_account_page.dart';
import 'home_cart_page.dart';
import 'home_favorit2_page.dart';
import 'home_lungangen_page.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              width: screenWidth,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Grid of categories
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: 15, // Adjust spacing between items
                mainAxisSpacing: 15, // Adjust spacing between items
                children: [
                  CategoryItem(
                      title: 'Fruits',
                      imagePath: 'assets/images/Grapes.png',
                      color: Colors.purple),
                  CategoryItem(
                      title: 'Vegetables',
                      imagePath: 'assets/images/Vagetables.png',
                      color: Colors.orange),
                  CategoryItem(
                      title: 'Meat',
                      imagePath: 'assets/images/only-meat.png',
                      color: Colors.redAccent),
                  CategoryItem(
                      title: 'Fish',
                      imagePath: 'assets/images/Fish.png',
                      color: Colors.redAccent),
                  CategoryItem(
                      title: 'Sea Food',
                      imagePath: 'assets/images/Sea-food.png',
                      color: Colors.amber),
                  CategoryItem(
                      title: 'Bowl',
                      imagePath: 'assets/images/Bowl.png',
                      color: Colors.green),
                  CategoryItem(
                      title: 'Essentials',
                      imagePath: 'assets/images/Essentials.png',
                      color: Colors.lightBlue),
                  CategoryItem(
                      title: 'Ice Cream',
                      imagePath: 'assets/images/ice-cream.png',
                      color: Colors.pinkAccent),
                  CategoryItem(
                      title: 'Cake',
                      imagePath: 'assets/images/Juis.png',
                      color: Colors.brown),
                  CategoryItem(
                      title: 'Essentials',
                      imagePath: 'assets/images/Essentials.png',
                      color: Colors.lightBlue),
                  CategoryItem(
                      title: 'Ice Cream',
                      imagePath: 'assets/images/ice-cream.png',
                      color: Colors.pinkAccent),
                  CategoryItem(
                      title: 'Cake',
                      imagePath: 'assets/images/Juis.png',
                      color: Colors.brown),
                  CategoryItem(
                      title: 'Fruits',
                      imagePath: 'assets/images/Grapes.png',
                      color: Colors.purple),
                  CategoryItem(
                      title: 'Vegetables',
                      imagePath: 'assets/images/Vagetables.png',
                      color: Colors.orange),
                  CategoryItem(
                      title: 'Meat',
                      imagePath: 'assets/images/only-meat.png',
                      color: Colors.redAccent),
                ],
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
              MaterialPageRoute(builder: (context) => CategoriesPage()),
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

// Category Item Widget
class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;

  CategoryItem({
    required this.title,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.15, // Adjusted width for the category item
          height: screenWidth * 0.15, // Adjusted height to match width
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.2),
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensure image covers the circle
              width: screenWidth * 0.15, // Set the width
              height: screenWidth * 0.15, // Set the height
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.035, // Smaller font size for the title
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
