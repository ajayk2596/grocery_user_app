import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/views/screens/auth/signup2verify_otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../controllers/provider/users/user_controller.dart';
import 'email_screen.dart';
import 'google_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserController>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Back arrow icon
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
                        onPressed: () {
                          // Handle back action here
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    // "Sign Up" text
                    Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Illustration Image
                    Center(
                      child: Image.asset(
                        "assets/images/verrynumber.png",
                        height: screenHeight * 0.25, // Adjust image height relative to screen height
                      ),
                    ),
                    SizedBox(height: 30),

                    // Name Surname TextField
                    Card(elevation: 2,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name Surname',
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    // Custom Phone Number TextField with Flag Icon and Arrow Dropdown
                    Card(
                      elevation: 2,
                      child: IntlPhoneField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          counterText: "",
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
                    ),
                    SizedBox(height: 20),

                    // Verification message text
                    Center(
                      child: Text(
                        'We need to verify you. We will send you a one-time verification code.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    // "Next" button
                    SizedBox(
                      width: double.infinity,
                      child: Card(elevation: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            data.phoneAuth(context, _phoneController.text);

                            // Handle next button action
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // "Already have an account? Login" text
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle login action
                            },
                            child: Text(
                              'Already have an account? Login',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          // Google and Email buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(elevation: 2,
                                child: IconButton(
                                  icon: Icon(Icons.g_translate),
                                  iconSize: 32,
                                  onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleAuthScreen(),));
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Card(elevation: 2,
                                child: IconButton(
                                  icon: Icon(Icons.email, color: Colors.orange, size: 32),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EmailLoginScreen(),));
                                    // Handle Email sign-in
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
