import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

import 'home_fruit_page.dart';
import 'home_lungangen_page.dart';

class VerifyOtp extends StatefulWidget {
  final String verifycationId;
  const VerifyOtp({super.key, required this.verifycationId});

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  // OTP controller
TextEditingController  pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios, color: Colors.orange),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child:  Image.asset("assets/images/otp.png"),
              ),
            ), // Replace with your own asset image
            SizedBox(height: 20),
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Enter Verification Code",
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "We have sent SMS to:",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              "046 XXX XX XX",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 30),
            // OTP Input fields
            Center(
              child: Container(
                child: Pinput(
                    defaultPinTheme: PinTheme(
                        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black54),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white70
                        )
                    ),
                    keyboardType: TextInputType.number,
                    controller: pinputController,
                    length: 6 ,
                    showCursor: true,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    textInputAction: TextInputAction.next,
                    onCompleted: (pinputController){
                      if(pinputController==123456){
                        Navigator.pop(context);MaterialPageRoute(builder: (_)=> HomePageApple());
                      }
                    }
                ),
                height: 70,
                width: 450,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                PhoneAuthCredential credentile = PhoneAuthProvider.credential(verificationId: widget.verifycationId, smsCode: pinputController.text);
                verifyOtp(credentile);
              },
              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create each OTP field
  Widget _buildOTPField(BuildContext context, TextEditingController controller) {
    return Container(
      width: 40,
      height: 55,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
  Future<void> verifyOtp(PhoneAuthCredential credential)async {

    FirebaseAuth.instance.signInWithCredential(credential).then((value){

      var id =value.user?.uid;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeLungungenPage(),));

    }).onError((error, stackTrace) {

      Fluttertoast.showToast(msg: "$error");
    });
  }
}