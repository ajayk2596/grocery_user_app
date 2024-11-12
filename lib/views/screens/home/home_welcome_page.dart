import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreenRealax extends StatefulWidget {
  @override
  _SignUpScreenRealaxState createState() => _SignUpScreenRealaxState();
}

class _SignUpScreenRealaxState extends State<SignUpScreenRealax> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image at the top
            Expanded(
              child: Center(
                child:  Image.asset("assets/images/Illustration.png"),
              ),
            ),
            SizedBox(height: 20),
            // Title Text
            Text(
              "Relax and shop",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 10),
            // Subtitle Text
            Text(
              "Shop online and get groceries delivered from stores to your home in as fast as 1 hour.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 40),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Sign Up logic
                setState(() {
                  // Any state change logic here, if required.
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            // Sign In Button
            OutlinedButton(
              onPressed: () {
                // Sign In logic
                setState(() {
                  // Any state change logic here, if required.
                });
              },
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                side: BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Sign in",
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            ),
            SizedBox(height: 40), // Padding at the bottom
          ],
        ),
      ),
    );
  }
}