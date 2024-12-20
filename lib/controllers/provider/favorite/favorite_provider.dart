import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/favoritemodel/favorite_model.dart';

class FavoriteProvider with ChangeNotifier{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get userId => _auth.currentUser?.uid;

  Future<bool> isFavorite(String productId) async {
    if (userId == null) return false;

    final doc = await _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(productId)
        .get();

    return doc.exists;
  }

  Future<void> toggleFavorite(FavoriteModel favorite) async {
    if (userId == null) return;

    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(favorite.id);

    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set(favorite.toMap());
    }
  }

  Future<List<FavoriteModel>> getFavorites() async {
    if (userId == null) return [];

    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .get();

    return querySnapshot.docs
        .map((doc) => FavoriteModel.fromMap(doc.data()))
        .toList();
  }
}
