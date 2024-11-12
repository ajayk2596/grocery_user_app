import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_user_app/views/screens/auth/email_screen.dart';
import 'package:grocery_user_app/views/screens/home/home_lungangen_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      _navigateBasedOnAuth();
    });
  }

  void _navigateBasedOnAuth() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomeLungungenPage() ,));
    } else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailLoginScreen(),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              child: Image.asset(
                'assets/images/Illustration.png', // Add your illustration image asset here
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Welcome To Grocery",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            strokeWidth: 5,
          ),
        ],
      ),
    );
  }
}
