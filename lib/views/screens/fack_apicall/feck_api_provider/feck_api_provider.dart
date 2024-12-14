import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../fack_api_model/feck_api_model.dart';

class FackProductProvider with ChangeNotifier {
  List<FackApiModel> _products = [];
  bool _isLoading = false;

  List<FackApiModel> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        _products = fackApiModelFromJson(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
