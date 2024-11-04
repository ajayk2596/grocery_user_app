import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/user_model.dart';
import '../../../views/screens/auth/signup2verify_otp.dart';
import '../../../views/screens/home/home_lungangen_page.dart';

class UserController with ChangeNotifier {

  UserModel? userData;
  File? profileImage;
  final ImagePicker _picker = ImagePicker();

  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  final StreamController<UserModel?> _userDataController = StreamController<UserModel?>.broadcast();

  Stream<UserModel?> get userDataStream => _userDataController.stream;

  void fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc = await _usersCollection.doc(currentUser.uid).get();
        if (userDoc.exists) {
          UserModel userData = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
          _userDataController.sink.add(userData);
          notifyListeners();
        } else {
          print("User data not found in Firestore.");
          _userDataController.sink.add(null);
          notifyListeners();
        }
      } catch (error) {
        print("Error fetching user data: $error");
        _userDataController.sink.addError(error);
        notifyListeners();
      }
    } else {
      print("No user is currently logged in.");
      _userDataController.sink.add(null);
      notifyListeners();

    }
  }



 ///////User Sign_up

  Future<void> userSignUp(
  { required BuildContext context,
    String? uid,
    File? imageFile,
    String? name,
    String? email,
    String? phone,
    String? password,
    }
      ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      User? user = userCredential.user;

      if (user != null) {
        String imageUrl = await _uploadProfileImage(user.uid, imageFile!);
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid':user.uid,
          'name': name,
          'email': email,
          'passWord':password,
           'phone': phone!,
          'imageUrl': imageUrl,
          'createdAt': Timestamp.now(),
        });

        Fluttertoast.showToast(msg: "Account created successfully!");

        // Navigate to home page
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLungungenPage(),));
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error signing up: ${error.toString()}");
    }
  }


// Helper function to upload the profile image
  Future<String> _uploadProfileImage(String userId, File imageFile) async {
    try {
      var storageRef = FirebaseStorage.instance.ref().child("profilePictures/$userId");
      await storageRef.putFile(imageFile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

//// User SignIn


  Future<void> userSignin(BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill in both email and password.");
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      Fluttertoast.showToast(msg: "Please enter a valid email address.");
      return;
    }

    if (password.length < 6) {
      Fluttertoast.showToast(msg: "Password should be at least 6 characters long.");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Fluttertoast.showToast(msg: "Login successful!");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeLungungenPage()),
        );
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error signing in: ${error.toString()}");
    }
  }

//  phone_auth


  var auth = FirebaseAuth.instance;
  var verify = "";

  void phoneAuth(BuildContext context,String phoneNumber)async {

    var number = "+91${phoneNumber}";
    print(number);
    auth.verifyPhoneNumber(
      timeout: Duration(seconds: 3),
      phoneNumber: number,
      verificationCompleted: (phoneAuthCredential) {
        print(phoneAuthCredential.verificationId);
      },
      verificationFailed: (error) {
        print(error.message);
      },
      codeSent: (verificationId, forceResendingToken) {
        verify = verificationId;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyOtp(verifycationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {

      },
    );
  }

  //  verify_otp

  Future<void> verifyOtp( BuildContext context,PhoneAuthCredential credential)async {

    FirebaseAuth.instance.signInWithCredential(credential).then((value){

      var id =value.user?.uid;

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeLungungenPage(),));

    }).onError((error, stackTrace) {

      Fluttertoast.showToast(msg: "$error");
    });
  }



  // Method to pick an image
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Upload profile image to Firebase Storage and return the download URL
  Future<String?> uploadImage(String userId,  user) async {
    if (profileImage != null) {
      try {
        var imageUpload = FirebaseStorage.instance.ref("profile/$userId");
        await imageUpload.putFile(profileImage!, SettableMetadata(contentType: "image/png"));
        return await imageUpload.getDownloadURL();


      } catch (error) {
        print("Error uploading image: $error");
      }
    } else {
      Fluttertoast.showToast(msg: "No image selected.");
    }
    return null;
  }


  // Add or update user information in Firestore
  Future<void> addOrUpdateUserData(String userId, UserModel user) async {
   // String? downloadUrl = await uploadImage(userId);
   //  if (downloadUrl != null) {
   //    user.profilePicture = downloadUrl;
   //  }

    try {
      await _usersCollection.doc(userId).set(user.toJson(), SetOptions(merge: true));
      Fluttertoast.showToast(msg: "User profile updated successfully");
      notifyListeners();
    } catch (error) {
      print('Error updating user profile: $error');
    }
  }



}