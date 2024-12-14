import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:grocery_user_app/controllers/auth/auth_controller.dart';
import 'package:grocery_user_app/register_page.dart';

import 'package:grocery_user_app/splash_screen.dart';
import 'package:grocery_user_app/views/screens/home/home_item_page.dart';
import 'package:grocery_user_app/views/screens/home/home_lungangen_page.dart';
import 'package:grocery_user_app/views/screens/home/order_accepeted_screen.dart';
import 'package:provider/provider.dart';
import 'RegisterScreen/register_screen.dart';
import 'controllers/provider/users/user_controller.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (Contxte)=> UserController(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );





  }
}


