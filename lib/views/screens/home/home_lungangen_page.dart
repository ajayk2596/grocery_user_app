import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/user_controller.dart';
import 'package:grocery_user_app/views/screens/home/home_drawer.dart';
import 'package:provider/provider.dart';
import 'home_account_page.dart';
import 'home_cart_page.dart';
import 'home_categories_screen.dart';
import 'home_favorit2_page.dart';
import 'home_fruit_page.dart';


class HomeLungungenPage extends StatefulWidget {
  @override
  _HomeLungungenPageState createState() => _HomeLungungenPageState();
}

class _HomeLungungenPageState extends State<HomeLungungenPage> {

  TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserController>(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
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
        actions: [
          IconButton(
            icon: Icon(Icons.menu_sharp, color: Colors.orange),
            onPressed: _openDrawer, // Open drawer on logout icon click
          ),
        ],
      ),
        drawer: UserDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                children: [
                  // Search Bar
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
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
                  SizedBox(height: screenHeight * 0.02),

                  // Categories Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Categories Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          child: CategoryItem(
                            title: 'Fruits',
                            imagePath: 'assets/images/Grapes.png',
                            color: Colors.purple,
                            screenWidth: screenWidth,
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePageApple (),));
                          },
                        ),
                        CategoryItem(
                          title: 'Vegetables',
                          imagePath: 'assets/images/Vagetables.png',
                          color: Colors.orange,
                          screenWidth: screenWidth,
                        ),
                        CategoryItem(
                          title: 'Meat',
                          imagePath: 'assets/images/only-meat.png',
                          color: Colors.redAccent,
                          screenWidth: screenWidth,
                        ),
                        CategoryItem(
                          title: 'Fish',
                          imagePath: 'assets/images/Fish.png',
                          color: Colors.redAccent,
                          screenWidth: screenWidth,
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
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Deals List
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DealItem(
                          title: 'Red Apple',
                          subtitle: '1kg, price',
                          price: '\$4.99',
                          imagePath: 'assets/images/Apple.png',
                          screenWidth: screenWidth,
                        ),
                        DealItem(
                          title: 'Original Banana',
                          subtitle: '1kg, price',
                          price: '\$5.99',
                          imagePath: 'assets/images/Banana.png',
                          screenWidth: screenWidth,
                        ),
                        DealItem(
                          title: 'Pineapple',
                          subtitle: '1kg, price',
                          price: '\$3.99',
                          imagePath: 'assets/images/Bowl.png',
                          screenWidth: screenWidth,
                        ),
                        DealItem(
                          title: 'Mango',
                          subtitle: '1kg, price',
                          price: '\$3.99',
                          imagePath: 'assets/images/Mango.png',
                          screenWidth: screenWidth,
                        ),
                      ],
                    ),
                  ),
                ],
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
Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    leading: Icon(icon, color: Colors.orange),
    title: Text(text, style: TextStyle(fontSize: 16)),
    onTap: onTap,
  );
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;
  final double screenWidth;

  CategoryItem({
    required this.title,
    required this.imagePath,
    required this.color,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.3,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            radius: screenWidth * 0.1,
            child: Image.asset(imagePath, height: screenWidth * 0.15, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
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
  final double screenWidth;

  DealItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.35,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: screenWidth * 0.2, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(subtitle, style: TextStyle(color: Colors.grey)),
          Text(price, style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

}
