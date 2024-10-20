import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/authantications/verify_otp.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var auth = FirebaseAuth.instance;
  var verify = "";

  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();

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
                        Navigator.pop(context); // Go back
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
                      height: constraints.maxHeight * 0.3,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Name Surname TextField
                  TextField(
                    controller: userNameController,
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


                  TextField(
                    controller: userPhoneController,
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
                      prefixIcon: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/flag.png",
                              width: 24,
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

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
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        phoneAuth();
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),


                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to login screen
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

  void phoneAuth() async {
    String number = "+91${userPhoneController.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) {
        print("Verification Completed: ${credential}");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification Failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verify = verificationId;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOtp(verifycationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Timeout: $verificationId");
      },
      timeout: Duration(seconds: 60), // Set timeout duration for code retrieval
    );
  }
}
