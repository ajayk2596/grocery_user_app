import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLungungenPage extends StatefulWidget {
  @override
  _HomeLungungenPageState createState() => _HomeLungungenPageState();
}

class _HomeLungungenPageState extends State<HomeLungungenPage> {
  // Search controller
  TextEditingController _searchController = TextEditingController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width; // Get screen width
    var screenHeight = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.orange),
        title: Text(
          'Lungangen',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
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
            SizedBox(height: screenHeight * 0.02), // 2% of screen height

            // Categories Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05, // Font size responsive to screen width
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ],
            ),
            SizedBox(height: screenHeight * 0.03),

            // Popular Deals Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Deals',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05, // Font size responsive to screen width
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            // Deals List
            Flexible(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DealItem(
                    title: 'Red Apple',
                    subtitle: '1kg, priceg',
                    price: '\$4.99',
                    imagePath: 'assets/images/Apple.png',
                  ),
                  DealItem(
                    title: 'Original Banana',
                    subtitle: '1kg, priceg',
                    price: '\$5.99',
                    imagePath: 'assets/images/Banana.png',
                  ),
                  DealItem(
                    title: 'Pineapple',
                    subtitle: '1kg, priceg',
                    price: '\$3.99',
                    imagePath: 'assets/images/Bowl.png',
                  ),
                  DealItem(
                    title: 'Mango',
                    subtitle: '1kg, priceg',
                    price: '\$3.99',
                    imagePath: 'assets/images/Mango.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Current selected index
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected index
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
}

// Category Item Widget
class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;

  CategoryItem({required this.title, required this.imagePath, required this.color});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width; // Dynamic width calculation
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          radius: screenWidth * 0.08, // Adjusted radius based on screen width
          child: Image.asset(
            imagePath,
            height: screenWidth * 0.08, // Adjusted image size
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // Dynamic font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class DealItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;

  DealItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width; // Dynamic width calculation
    return Flexible(
      child: Container(
        width: screenWidth * 0.4, // Adjusted width based on screen width
        margin: EdgeInsets.only(right: screenWidth * 0.02), // Adjusted margin
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Prevent image overflow by clipping it
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Add border radius for smooth corners
              child: Container(
                height: screenWidth * 0.4, // Adjust height as needed
                width: screenWidth * 0.4, // Adjust width as needed
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Ensures the image fits and avoids overflow
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1, // Prevents overflow by limiting text to one line
              overflow: TextOverflow.ellipsis, // Adds ellipsis if text is too long
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey),
              maxLines: 1, // Prevents overflow in subtitle
              overflow: TextOverflow.ellipsis, // Adds ellipsis if text is too long
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1, // Prevent overflow in price
              overflow: TextOverflow.ellipsis, // Adds ellipsis if text is too long
            ),
            SizedBox(height: 10),
            Icon(
              Icons.add_circle,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

