import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../models/products/products_models.dart';

class ProductProvider with ChangeNotifier {

  List<Product> _products = [];
  bool _isLoading = false;

  late final String categoryId;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

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


}
