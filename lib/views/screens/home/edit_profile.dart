import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  //final FirebaseStorage _storage = FirebaseStorage.instance;
  //final Reference storageRef = _storage.ref().child('profilePicture/$cId');

  var cId=FirebaseAuth.instance.currentUser?.uid;

  File? _imageFile;
  String? _imageUrl;
  final picker = ImagePicker();
  final   _storage = FirebaseStorage.instance;

  // Function to select a new image
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      //await _updateImage();
    }
  }

  Future<void> _updateImage(String cId) async {
    if (_imageFile == null) return;

    try {
      // Get the current user's UID
      var cId = FirebaseAuth.instance.currentUser?.uid;

      // Define a storage reference path using the UID
      final Reference storageRef = FirebaseStorage.instance
          .ref().child('profilePictures/$cId'); // Fixed path

      // Upload the new file (this will overwrite the existing image)
      await storageRef.putFile(_imageFile!);

      // Get the download URL of the updated image
      String downloadURL = await storageRef.getDownloadURL();
      print("Image updated successfully. Download URL: $downloadURL");

      // Use this URL to update in the database or display
    } catch (e) {
      print("Error updating image: $e");
    }
  }

  TextEditingController _editName=TextEditingController();
  TextEditingController _editEmail=TextEditingController();
  TextEditingController _editPhone=TextEditingController();
  final firebaseStore=FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
       body: FutureBuilder(future: firebaseStore.get(), builder: (context, snapshot) {
         if(snapshot.hasError){
           return Text('${snapshot.hasError}');
         }
        else if(snapshot.hasData){
          var data= snapshot.data;
          return ListView.builder(
            itemCount: data?.docs.length,
            itemBuilder: (context, index){
             return  Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(height: 50,),

                  CircleAvatar(
                    maxRadius: 50,
                    backgroundImage:  NetworkImage(data?.docs[index]["imageUrl"]),
                  ),

                  Text(data?.docs[index]["name"]),
                  Text(data?.docs[index]["email"]),
                  Text(data?.docs[index]["phone"]),
                   SizedBox(height: 10,),

                   ElevatedButton(
                     onPressed: () {
                       showBottomSheet(context: context, builder: (context) {
                           return SingleChildScrollView(
                             child: Column(
                               children: [
                                 GestureDetector(
                                   onTap: _pickImage, // Trigger image picker on tap
                                   child: Center(
                                     child:_imageFile==null? Container(
                                         child: Icon(Icons.person),
                                         height: 80,
                                         width: 80,
                                         decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                           color: Colors.grey,
                                          )
                                           ): Container(
                                       height: 80,
                                       width: 80,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         //borderRadius: BorderRadius.circular(65),
                                         color: Colors.grey,
                                         image: DecorationImage(
                                             image: FileImage(_imageFile!)),
                                       ),
                                     ),
                                   ),
                                 ),


                                 Text('Update Data',style: TextStyle(color: Colors.orange,fontSize: 25),),
                                 SizedBox(height: 5,),
                                 TextField(
                                   controller: _editName,
                                   decoration: InputDecoration(
                                       hintText: "Name",
                                       labelText: "Name",
                                       border: OutlineInputBorder()
                                   ),
                                 ),
                                 SizedBox(height: 5,),
                                 TextField(
                                   controller: _editEmail,
                                   decoration: InputDecoration(
                                       hintText: "Email",
                                       labelText: "Email",
                                       border: OutlineInputBorder()
                                   ),
                                 ),
                                 SizedBox(height: 5,),
                                 TextField(
                                   controller: _editPhone,
                                   decoration: InputDecoration(
                                       hintText: "Phone",
                                       labelText: "Phone",
                                       border: OutlineInputBorder()
                                   ),
                                 ),
                                 SizedBox(height: 5,),
                                 ElevatedButton(onPressed: () async {
                                   Navigator.pop(context);
                                   setState(() {});
                                 await  updateData(data?.docs[index]["uid"]).then((value) {
                                   //_updateImage(data?.docs[index]["uid"]);
                                   Fluttertoast.showToast(msg: 'Update Successfull');
                                 },).onError((error, stackTrace) {
                                   Fluttertoast.showToast(msg: 'Update failled');
                                 },);
                                 }, child: Text('Submit')),

                               ],
                             ),
                           );
                         },);
                      },
                     child: SizedBox(
                       width: 250, // Set the width you want
                       child: Center(
                         child: Text('Edit Data'),
                       ),
                     ),
                   ),


                 ]
               ),
             );
          },
          );

         }

        else{
          return Text('No Data');
         }

      },),
    );
  }

 Future<void> updateData(String uid)async {
     firebaseStore.doc(uid).update({
        "name": _editName.text,
       "email": _editEmail.text,
       "phone": _editPhone.text,
     });
  }

}
