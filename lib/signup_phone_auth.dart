import 'package:flutter/material.dart';

class phone_auth extends StatefulWidget {
  @override
  _phone_authState createState() => _phone_authState();
}

class _phone_authState extends State<phone_auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: constraints.maxHeight * 0.3, // Adjust image height relative to screen height
                    ),
                  ),
                  SizedBox(height: 30),

                  // Name Surname TextField
                  TextField(
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
                  SizedBox(height: 15),

                  // Custom Phone Number TextField with Flag Icon and Arrow Dropdown
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: 'Phone Number',
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      // Prefix with Flag icon and dropdown arrow
                      prefixIcon: Container(
                        width: 90, // Adjust as needed
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Flag image (Provide the image file path)
                            Image.asset(
                              "assets/images/flag.png",
                              width: 24, // Flag size
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_drop_down), // Arrow icon for dropdown
                          ],
                        ),
                      ),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Handle next button action
                        setState(() {
                          // Add state logic here if necessary
                        });
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // "Already have an account? Login" text
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle login action
                        setState(() {
                          // Add state logic if necessary
                        });
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
