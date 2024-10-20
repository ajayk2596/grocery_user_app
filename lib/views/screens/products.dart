import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Products Screen",style: TextStyle(fontSize: 30,color: Colors.orange),),
      ),
    );
  }
}
