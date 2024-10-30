// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:grocery_user_app/signup2verify_otp.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//
//   var auth = FirebaseAuth.instance;
//   var verify = "";
//   final _namrController = TextEditingController();
//   final _phoneController = TextEditingController(); // Phone number controller
//   String? _completePhoneNumber; // To store full phone number
//
//   @override
//   void dispose() {
//     _phoneController.dispose(); // Dispose controller to avoid memory leaks
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Back arrow icon
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
//                       onPressed: () {
//                         // Handle back action here
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20),
//
//                   // "Sign Up" text
//                   Center(
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//
//                   // Illustration Image
//                   Center(
//                     child: Image.asset(
//                       "assets/images/verrynumber.png",
//                       height: constraints.maxHeight * 0.3, // Adjust image height relative to screen height
//                     ),
//                   ),
//                   SizedBox(height: 30),
//
//                   // Name Surname TextField
//                   TextField(
//                     controller: _namrController,
//                     decoration: InputDecoration(
//                       hintText: 'Name Surname',
//                       contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                     ),
//                   ),
//                   SizedBox(height: 15),
//
//                   // Custom Phone Number TextField with Flag Icon and Arrow Dropdown
//                   IntlPhoneField(
//                     controller: _phoneController,
//                     decoration: InputDecoration(
//                      hintText: "Phone Number",
//
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                     ),
//                     initialCountryCode: 'IN', // Default country code (India)
//                     onChanged: (phone) {
//                       setState(() {
//                         _completePhoneNumber = phone.completeNumber; // Get the full phone number with country code
//                       });
//                       print(_completePhoneNumber); // Optional: Log the full phone number
//                     },
//                   ),
//                   SizedBox(height: 20),
//
//                   // Verification message text
//                   Center(
//                     child: Text(
//                       'We need to verify you. We will send you a one-time verification code.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30),
//
//                   // "Next" button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange, // Background color
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                       ),
//                       onPressed: () {
//                         phoneAuth();
//                         // Handle next button action
//                         if (_completePhoneNumber != null) {
//                           // Add logic to handle the phone number here
//                           print("Phone number: $_completePhoneNumber");
//                         }
//                       },
//                       child: Text(
//                         'Next',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//
//                   // "Already have an account? Login" text
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         // Handle login action
//                       },
//                       child: Text(
//                         'Already have an account? Login',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.orange,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//   void phoneAuth()async {
//
//     var number = "+91${_phoneController.text}";
//     print(number);
//     auth.verifyPhoneNumber(
//       timeout: Duration(seconds: 3),
//       phoneNumber: number,
//       verificationCompleted: (phoneAuthCredential) {
//         print(phoneAuthCredential.verificationId);
//       },
//       verificationFailed: (error) {
//         print(error.message);
//       },
//       codeSent: (verificationId, forceResendingToken) {
//         verify = verificationId;
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => VerifyOtp(verifycationId: verificationId),
//           ),
//         );
//       },
//       codeAutoRetrievalTimeout: (verificationId) {
//
//       },
//     );
//   }
// }
