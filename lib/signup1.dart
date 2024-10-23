import 'package:flutter/material.dart';

class SignUpScreens2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Screen size ko capture karne ke liye MediaQuery ka use karenge
    var screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,  // This allows the content to adjust when the keyboard appears
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
            color: Colors.orange,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(  // SingleChildScrollView to prevent overflow
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.07, // Font size responsive
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenSize.width * 0.5,
                  height: screenSize.height * 0.2,
                  child: Image.network("assets/images/mobile.png"), // Replace with valid image URL
                ),
                SizedBox(height: 10),
                Text(
                  'Enter the password',
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'For the security & safety please choose a password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: screenSize.width * 0.04, // Responsive font size
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.orange),
                    suffixIcon: Icon(Icons.visibility, color: Colors.orange),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.orange),
                    suffixIcon: Icon(Icons.visibility, color: Colors.orange),
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.02,
                      horizontal: screenSize.width * 0.3, // Responsive padding
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.045, // Responsive font size
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
