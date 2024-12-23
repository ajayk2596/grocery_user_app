import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/users/user_model.dart';
import '../../../views/screens/auth/signup2verify_otp.dart';
import '../../../views/screens/home/home_lungangen_page.dart';

class UserController with ChangeNotifier {
  File? profileImage;
  final ImagePicker _picker = ImagePicker();

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final StreamController<UserModel?> _userDataController =
      StreamController<UserModel?>.broadcast();

  Stream<UserModel?> get userDataStream => _userDataController.stream;

  UserModel? _userData;

  UserModel? get userData => _userData;

  UserController() {
    _initUserListener();
  }

  void _initUserListener() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _listenToUserData(user.uid);
      } else {
        _userData = null;
        notifyListeners();
      }
    });
  }

  void _listenToUserData(String uid) {
    _usersCollection.doc(uid).snapshots().listen(
      (DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          _userData =
              UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
          notifyListeners();
        }
      },
      onError: (error) {
        print("Error fetching user data: $error");
      },
    );
  }

  Future<void> userSignUp({
    required BuildContext context,
    String? uid,
    File? imageFile,
    String? name,
    String? email,
    String? phone,
    String? password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      User? user = userCredential.user;

      if (user != null) {
        String imageUrl = await _uploadProfileImage(user.uid, imageFile!);
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'passWord': password,
          'phone': phone!,
          'imageUrl': imageUrl,
          'createdAt': Timestamp.now(),
        });

        Fluttertoast.showToast(msg: "Account created successfully!");

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLungungenPage(),
            ));
        notifyListeners();
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Error signing up: ${error.toString()}");
    }
  }

  Future<String> _uploadProfileImage(String userId, File imageFile) async {
    try {
      var storageRef =
          FirebaseStorage.instance.ref().child("profilePictures/$userId");
      await storageRef.putFile(imageFile);
      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return "";
    }
  }

  Future<void> updateUserProfile({
    required String uid,
    String? name,
    String? email,
    String? phone,
    File? imageFile,
    required BuildContext context,
    required String password,
  }) async {
    try {
      String? imageUrl;
      if (imageFile != null) {
        imageUrl = await _uploadProfileImage(uid, imageFile);
      }

      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': name,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl ?? _userData?.imageUrl,
      });

      Fluttertoast.showToast(msg: "Profile updated successfully!");
      notifyListeners();
    } catch (error) {
      Fluttertoast.showToast(
          msg: "Error updating profile: ${error.toString()}");
    }
  }

  Future<void> userSignin(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill in both email and password.");
      return;
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      Fluttertoast.showToast(msg: "Please enter a valid email address.");
      return;
    }

    if (password.length < 6) {
      Fluttertoast.showToast(
          msg: "Password should be at least 6 characters long.");
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
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

  var auth = FirebaseAuth.instance;
  var verify = "";

  void phoneAuth(BuildContext context, String phoneNumber) async {
    var number = "+91${phoneNumber}";
    print(number);
    auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 3),
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
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> verifyOtp(
      BuildContext context, PhoneAuthCredential credential) async {
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      var id = value.user?.uid;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeLungungenPage(),
          ));
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: "$error");
    });
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}
