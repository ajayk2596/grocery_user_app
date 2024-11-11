import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_user_app/RegisterScreen/login_page.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String? _downloadURL;

  Future<void> _uploadFile() async {
    if (_image == null) return;

    // File ko Firebase Storage mein upload karne ke liye filename generate karein
    //String fileName = basename(_image!.path);

    String filePath = 'userImages/${DateTime.now().millisecondsSinceEpoch}.jpg';
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(filePath);

    try {
      // Upload task start
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      await uploadTask;
      // Upload ke baad download URL get karenge
      _downloadURL = await firebaseStorageRef.getDownloadURL();
      var id= DateTime.now().microsecondsSinceEpoch.toString();

      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      firebase.doc(id).set({
        "name": _nameController.text,
        "email": _emailController.text,
        //"pass": _nameController.text,
        "imageUrl":_downloadURL.toString()
      });

      setState(() {
        _downloadURL = _downloadURL;
      });
      print("File uploaded! Download URL: $_downloadURL");
    } catch (e) {
      print("Error uploading file: $e");
    }
  }

  File? _image; // Store selected image
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the image
      });
    }
  }

  final firebase = FirebaseFirestore.instance.collection("userDetails");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
        backgroundColor: Colors.orange,
      ),
    body: Column(
      children: [
        const SizedBox(height: 50,),

        GestureDetector(
          onTap: _pickImage, // Trigger image picker on tap
          child: Center(
            child:_image==null? Container(
                child: Icon(Icons.person),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  //borderRadius: BorderRadius.circular(15),
                )): Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(65),
                color: Colors.grey,
                image: DecorationImage(
                    image: FileImage(_image!)),
              ),
            ),
          ),
        ),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            //helperText: "Name",
            labelText: "Name",
            border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 5,),
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
           await _uploadFile().then((value) {
              Fluttertoast.showToast(msg: "successfull");
            },).onError((error, stackTrace) {
              Fluttertoast.showToast(msg: "Failled");

            },);
        }, child: Text('Add Data')),
           Padding(
             padding: const EdgeInsets.only(left: 168.0),
             child: InkWell(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPages(),));
               },
                 child: Text('Login')),
           ),
      ],
    ),
    );
  }
}
