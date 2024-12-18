import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/products/products_models.dart';
class CartProvider extends ChangeNotifier {


  int _counter=0;

  get counter=>_counter;

  addToCartIncrement(){
    _counter++;
    notifyListeners();
  }

   setCounter(int count) {
    _counter = count;
    notifyListeners();
  }
  addToCartDecrement(){
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }




  Future<void> addToCartFirebase(Product product) async {

    final String uid = getCurrentUserId();

    if (uid.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('carts')
            .doc(uid)
            .collection('userCart')
            .doc(product.id.toString())
            .set({
          'title': product.title,
          'price': product.price,
          'thumbnail': product.thumbnail,
          'quantity': 1,
          'addedAt': DateTime.now(),
        });
        addToCartIncrement();
        notifyListeners();
      } catch (e) {
        debugPrint("Error adding product to Firebase: $e");
      }

    } else {
      debugPrint("User not logged in.");
    }
  }

  Stream<List<Map<String, dynamic>>> getCartItems() {
    final String uid = getCurrentUserId();

    if (uid.isNotEmpty) {
      var result = FirebaseFirestore.instance
          .collection('carts')
          .doc(uid)
          .collection('userCart')
          .snapshots()
          .map((snapshot) {
        setCounter(snapshot.docs.length);

        return snapshot.docs.map((doc) {
          return {
            'id': doc.id,
            ...doc.data(), // Spreading the document data
          };
        }).toList();
      });

      return result;
    } else {
      return const Stream.empty();
    }
  }



  Future<void> removeFromCartFirebase(Product product) async {


    final String uid = getCurrentUserId();

    if (uid.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('carts')
            .doc(uid)
            .collection('userCart')
            .doc(product.id.toString())
            .delete();

        addToCartDecrement();
        notifyListeners();
      } catch (e) {
        debugPrint("Error removing product from Firebase: $e");
      }
    }
  }



  String getCurrentUserId() {
    final User? user = FirebaseAuth.instance.currentUser;
    return user?.uid ?? '';
  }
}
