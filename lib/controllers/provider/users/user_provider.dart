import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/users/user_details_model.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add User Details for Current User
  Future<void> addUserDetails(UserDetailsModel userDetails) async {
    // Get current user's UID
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      print("Error: No user is logged in!");
      return;
    }
    String userId = currentUser.uid;

    try {

      // Add userId to userDetails before saving to Firestore
      userDetails.userId = userId;

      // Save user details to Firestore
      await _firestore
          .collection('userdetails')
          .doc(userId) // Save data under user's UID
          .set(userDetails.toJson());

      print("User details added successfully for userId: $userId");
    } catch (e) {
      print("Error adding user details: $e");
    }
  }

  // Update User Details
  Future<void> updateUserDetails(String userId, UserDetailsModel updatedDetails) async {
    try {
      await FirebaseFirestore.instance
          .collection('userdetails') // Ensure this collection name is correct
          .doc(userId)
          .update(updatedDetails.toJson());
    } catch (e) {
      throw Exception("Update failed: $e");
    }
  }



  // Get User Details
  Stream<UserDetailsModel?> getUserDetailsStream(String userId) {
    return _firestore.collection('userdetails').doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return UserDetailsModel.fromJson(snapshot.data()!);
      } else {
        print("No user details found for userId: $userId");
        return null;
      }
    });
  }
}
