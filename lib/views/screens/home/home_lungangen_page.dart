import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/user_controller.dart';
import 'package:grocery_user_app/views/screens/auth/sign_in_page.dart';
import 'package:grocery_user_app/views/screens/auth/signup1.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import 'home_fruit_page.dart';
import 'home_profile_page.dart';

class HomeLungungenPage extends StatefulWidget {
  @override
  _HomeLungungenPageState createState() => _HomeLungungenPageState();
}

class _HomeLungungenPageState extends State<HomeLungungenPage> {
  TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  // Define GlobalKey for Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Drawer open function
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserController>(context);
    return Scaffold(
      key: _scaffoldKey,  // Attach GlobalKey to Scaffold
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
            icon: Icon(Icons.more_vert, color: Colors.orange),
            onPressed: _openDrawer, // Open drawer on logout icon click
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            StreamBuilder<UserModel?>(
              stream: data.userDataStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Center(
                      child: Text(
                        'Error loading user data',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Center(
                      child: Text(
                        'User data not found.',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                } else {
                  final userData = snapshot.data!;
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: userData.profilePicture != null
                              ? NetworkImage(userData.profilePicture!)
                              : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                          child: userData.profilePicture == null
                              ? Icon(Icons.person, size: 40, color: Colors.white)
                              : null,
                        ),
                        SizedBox(height: 10),
                        Text(
                          userData.uname ?? 'User Name',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          userData.uemail ?? 'Email',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          userData.phone ?? 'Phone',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageSignInKey()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle settings action
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Forget Password'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreens2()));
              },
            ),
          ],
        ),
      ),




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
