import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLungungenPage extends StatefulWidget {
  @override
  _HomeLungungenPageState createState() => _HomeLungungenPageState();
}

class _HomeLungungenPageState extends State<HomeLungungenPage> {
  // Search controller
  TextEditingController _searchController = TextEditingController();

  // Maintain current selected index for BottomNavigationBar
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
        padding: EdgeInsets.all(screenWidth * 0.07), // 4% of screen width for padding
        child: SingleChildScrollView( // Allows scrolling when content overflows
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

              // Categories Row
              SingleChildScrollView( // Allows horizontal scrolling for categories
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryItem(
                      title: 'Fruits',
                      imagePath: 'assets/images/Grapes.png',
                      color: Colors.purple,
                    ),
                    CategoryItem(
                      title: 'Vegetables',
                      imagePath: 'assets/images/Vagetables.png',
                      color: Colors.orange,
                    ),
                    CategoryItem(
                      title: 'Meat',
                      imagePath: 'assets/images/only-meat.png',
                      color: Colors.redAccent,
                    ),
                    CategoryItem(
                      title: 'Fish',
                      imagePath: 'assets/images/Fish.png',
                      color: Colors.redAccent,
                    ),
                  ],
                ),
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
              SingleChildScrollView( // Allows horizontal scrolling for deals
                scrollDirection: Axis.horizontal,
                child: Row(
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
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all items are displayed evenly
        currentIndex: _currentIndex, // Current selected index
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        iconSize: screenWidth * 0.06, // Keep icon size fixed for all items
        selectedFontSize: screenWidth * 0.035, // Keep font size fixed
        unselectedFontSize: screenWidth * 0.035, // Keep font size same for selected/unselected
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
    return Container(
      width: screenWidth * 0.25, // Make width responsive
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
    return Container(
      width: screenWidth * 0.35, // Adjusted width to make smaller
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
          // Reduced the size of the image
          Container(
            height: screenWidth * 0.2, // Reduced height to make image smaller
            width: screenWidth * 0.2,  // Reduced width to make image smaller
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensures the image covers the container proportionally
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
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
