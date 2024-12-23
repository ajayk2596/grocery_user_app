import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_user_app/views/screens/home/home_lungangen_page.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for illustration
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/Vavoruite.png', // Add your illustration image asset here
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your heart is empty",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Start fall in love with some good goods",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeLungungenPage(),));
                },
                child: Text(
                  "Start shopping",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}