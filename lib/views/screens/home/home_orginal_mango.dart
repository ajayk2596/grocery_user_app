import 'dart:io';

import 'package:flutter/material.dart';

class HomeProductPage extends StatefulWidget {

  final String imageUrl;
  final String  name;
  final double price;
  final String description;

  const HomeProductPage({super.key, required this.imageUrl, required this.name, required this.price, required this.description});

  @override
  _HomeProductPageState createState() => _HomeProductPageState();
}

class _HomeProductPageState extends State<HomeProductPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Mango Shop'),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 50,
                backgroundImage:NetworkImage(widget.imageUrl) ,
              ),


              Text(widget.price.toString()),
              Text(widget.description.toString()),
            ],
          )
        ),
      ),
     );
  }
 }