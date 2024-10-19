import 'dart:async';

import 'package:flutter/material.dart';

import 'authantications/phone_auth.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {


    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(

          child: Container(
            height: 200,
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.contain,
            ),
          ),
        ),

        Text(
          "Splash Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          strokeWidth: 5,
        ),

      ],
    ),);
  }
}
