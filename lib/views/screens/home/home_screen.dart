import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/carts/cart_provider.dart';
import 'package:provider/provider.dart';
import '../carts/cart_screen.dart';
import '../accounts/home_account_page.dart';
import '../categories/home_categories_screen.dart';
import '../favorites/home_favorit2_page.dart';
import 'home_lungangen_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userId;
  int _currentIndex = 0;
  late List<Widget> _screens;


  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser?.uid;
    print("userId My $userId");
    _screens = [
      HomeLungungenPage(),
      HomeCategoriesScreen(),
      const CartScreen(),
      if (userId != null) FavoriteScreenTwo(),
      HomeAccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    provider.getCartItems();

    return Scaffold(
      body: _screens[_currentIndex],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                if (provider.counter > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${provider.counter}',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:grocery_user_app/controllers/provider/carts/cart_provider.dart';
// import 'package:provider/provider.dart';
//
// import '../carts/cart_screen.dart';
// import '../accounts/home_account_page.dart';
// import '../categories/home_categories_screen.dart';
// import '../favorites/home_favorit2_page.dart';
// import 'home_lungangen_page.dart';
//
// class HomeScreen extends StatefulWidget {
//
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   String? userId;
//
//   int _currentIndex = 0;
//
//   late List<Widget> _screens;
//   @override
//   void initState() {
//     userId=FirebaseAuth.instance.currentUser?.uid;
//     super.initState();
//   }
//   _screens = [
//     HomeLungungenPage(),
//     HomeCategoriesScreen(),
//     const CartScreen(),
//   if (userId != null) FavoriteScreenTow(userId: userId!),
//     HomeAccountScreen(),
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<CartProvider>(context);
//     provider.getCartItems();
//     return Scaffold(
//       body: _screens[_currentIndex], // Display screen based on index
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//
//             icon: Icon(Icons.shop),
//             label: 'Shop',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.explore),
//             label: 'Explore',
//           ),
//           BottomNavigationBarItem(
//             icon: Stack(
//               children: [
//                 Icon(Icons.shopping_cart),
//                 if (provider.counter > 0) // Show badge only if count > 0
//                   Positioned(
//                     right: 0,
//                     child: Container(
//
//                       padding: EdgeInsets.all(2),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       constraints: BoxConstraints(
//                         minWidth: 16,
//                         minHeight: 16,
//                       ),
//                       child: Text(
//                         '${provider.counter}',
//                         style: TextStyle(
//                           color: Colors.yellow,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }
