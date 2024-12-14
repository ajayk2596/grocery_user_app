import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier{

  final init=FirebaseAuth.instance;
  final c=FirebaseFirestore.instance;
  void signupWEmailAndPassword(String email ,String password)async{
    await init.createUserWithEmailAndPassword(email: email, password: password);

    var cId=FirebaseAuth.instance.currentUser!.uid;
    await c.collection('users').doc(cId).set({
      "uid":cId,
      "email":email,
      "password":password
    });

    notifyListeners();
  }
  void signInWEmailAndPassword(String email ,String password)async{
    await init.signInWithEmailAndPassword(email: email, password: password);
    notifyListeners();
  }

}