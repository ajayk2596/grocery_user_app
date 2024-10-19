import 'package:flutter/material.dart';
import 'package:grocery_user_app/views/screens/slider/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> images = [
      'assets/images/j.jpeg',
      'assets/images/j.jpeg',
      'assets/images/j.jpeg',
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SliderScreen(),
    );
  }
}

