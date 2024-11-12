import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 Future<void> userSigning()async {
  await  _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Login Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
           TextField(
            controller: _emailController,
            decoration: InputDecoration(
              //helperText: "Email",
                labelText: "Email",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 5,),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              //helperText: "Password",
                labelText: "Password",
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 5,),

          ElevatedButton(onPressed: () async {
            setState(() {});
           await  userSigning().then((value) {
            Fluttertoast.showToast(msg: "successfull");
            },).onError((error, stackTrace) {
              Fluttertoast.showToast(msg: "Failled");

            },);
          }, child: Text('Add Data'))

        ],
      ),
    );
  }
}
