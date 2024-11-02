import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/ViewProduct/view_product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _downloadURL;

  Future<void> _uploadFile() async {
    if (_image == null) return;

    // File ko Firebase Storage mein upload karne ke liye filename generate karein
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');

    try {
      // Upload task start
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      await uploadTask;

      // Upload ke baad download URL get karenge
      String downloadURL = await firebaseStorageRef.getDownloadURL();
      firebase.doc().set({
        "name": nameController.text,
        "dess": desController.text,
        "quantity": quantityController.text,
        "timing":DateTime.timestamp(),
        "date": DateTime.now(),
        //"image": "https://statusneo.com/wp-content/uploads/2023/02/MicrosoftTeams-image551ad57e01403f080a9df51975ac40b6efba82553c323a742b42b1c71c1e45f1.jpg",
        "image": downloadURL,
        "pricr": priceController.text,
      });

      setState(() {
        _downloadURL = downloadURL;
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

  TextEditingController nameController =TextEditingController();
  TextEditingController desController =TextEditingController();
  TextEditingController quantityController =TextEditingController();
   //TextEditingController timingController =TextEditingController();
  //TextEditingController dateController =TextEditingController();
  TextEditingController priceController =TextEditingController();
  //TextEditingController imageController =TextEditingController();

  DateTime now = DateTime.now();
  //DateTime onlyDate = DateTime(now.hour, now.minute, now.second);

   var firebase=FirebaseFirestore.instance.collection("Product");


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('Add Product',style: TextStyle(color: Colors.orange),),
       ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: screenHeight*0.02),
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

            SizedBox(height: screenHeight*0.01,),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: 'Product Name',
                    labelText: 'Product Name',
                    border: OutlineInputBorder()
                ),

              ),
            ),
            SizedBox(height: screenHeight*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: TextField(
                controller: desController,
                decoration: InputDecoration(
                    hintText: 'Product descerption',
                    labelText: 'Product descerption',
                    border: OutlineInputBorder()
                ),

              ),
            ),
            SizedBox(height: screenHeight*0.01,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: TextField(
                controller: quantityController,
                decoration: InputDecoration(
                    hintText: 'Product quantity',
                    labelText: 'Product quantity',
                    border: OutlineInputBorder()
                ),

              ),
            ),
            SizedBox(height: screenHeight*0.01,),
             Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                    hintText: 'Product Price',
                    labelText: 'Product Price',
                    border: OutlineInputBorder()
                ),

              ),
            ),
              SizedBox(height: screenHeight*0.3,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
               setState(() {});
                 _uploadFile();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProduct(),));
               }, child: Text('Add Data')),
            )
          ],
        ),
      ),
    );
  }
}
