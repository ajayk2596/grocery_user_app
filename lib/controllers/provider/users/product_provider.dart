import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import '../../../models/products_models.dart';

class ProductProvider with ChangeNotifier {
  int _count=0;
  List<Product> _products = [];
  bool _isLoading = false;

  late final String categoryId;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');

    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final userModel = ProductApiModel.fromJson(data);

        _products = userModel.products ?? [];
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


get count => _count;
  void incrementAddToCart(){
    _count++;
    notifyListeners();
  }


  void decrimentAddToCart(){
    -_count--;
    notifyListeners();
  }


  void addProductsToFirebase(Product product) {
    final docRef = FirebaseFirestore.instance.collection('addtocart').doc(product.id.toString());
    docRef.set({
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'thumbnail': product.thumbnail,
      'discountPercentage': product.discountPercentage,
      'quantity': 1, // Default quantity
    }).then((_) {
      print("${product.title} added to Firebase!");
    }).catchError((error) {
      print("Failed to add product: $error");
    });
  }




}
