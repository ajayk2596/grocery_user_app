import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/sign_in_page.dart';
import 'package:grocery_user_app/signup2verify_otp.dart';
import 'package:grocery_user_app/signup_phone_auth.dart';

import 'firebase_options.dart';
import 'home_account_page.dart';
import 'home_cart_page.dart';
import 'home_cartdelet_page.dart';
import 'home_favorit2_page.dart';
import 'home_favorite_page.dart';
import 'home_fruit_page.dart';
import 'home_lungangen_page.dart';
import 'home_order_page.dart';
import 'home_orginal_mango.dart';
import 'home_profile_page.dart';
import 'home_welcome_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignUpScreen()
    );
  }
}
