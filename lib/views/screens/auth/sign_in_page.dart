import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class HomePageSignInKey extends StatefulWidget {
  @override
  _HomePageSignInKeyState createState() => _HomePageSignInKeyState();
}

class _HomePageSignInKeyState extends State<HomePageSignInKey> {
  bool _isPasswordVisible = false;
  final _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.orange),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title Text
              Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02), // Responsive spacing

              // Image Section
              Center(
                child: Image.asset(
                  "assets/images/key..png", // Update with correct image path
                  height: screenHeight * 0.25, // Responsive image height
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Instruction Text
              Text(
                'Enter your phone number and password to access your account',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: screenHeight * 0.02),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Phone Number TextField
              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "Phone Number",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                initialCountryCode: 'IN', // Default country code (India)
                onChanged: (phone) {
                  // Optional: Log the full phone number
                },
              ),

              SizedBox(height: screenHeight * 0.02),

              // Password TextField
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: screenHeight * 0.02, horizontal: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.01),

              // Forgot Password Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.orange, fontSize: screenHeight * 0.018),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Sign In Button
              ElevatedButton(
                onPressed: () {
                  // Sign In action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                ),
                child: Text('Sign in', style: TextStyle(fontSize: screenHeight * 0.025)),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Sign Up Text
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to Sign Up
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: screenHeight * 0.02),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
