import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/controllers/provider/users/cart_provider.dart';
import 'package:grocery_user_app/controllers/provider/users/user_controller.dart';
import 'package:grocery_user_app/splash_screen.dart';
import 'package:grocery_user_app/views/screens/NewAddress/new_address.dart';
import 'package:grocery_user_app/views/screens/home/home_lungangen_page.dart';
import 'package:grocery_user_app/views/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../controllers/provider/users/product_provider.dart';
import 'controllers/provider/users/user_provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
