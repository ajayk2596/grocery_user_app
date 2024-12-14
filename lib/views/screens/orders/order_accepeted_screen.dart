import 'package:flutter/material.dart';


class OrderAcceptedScreen extends StatefulWidget {
  @override
  _OrderAcceptedScreenState createState() => _OrderAcceptedScreenState();
}

class _OrderAcceptedScreenState extends State<OrderAcceptedScreen> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/OrderAccepts.png', // Replace with the path to your asset image
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Your Order Has Been Accepted",

              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontSize: screenWidth * 0.05,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We've accepted your order, and we're getting it ready.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle Track Order button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: screenWidth * 0.3),
              ),
              child: Text("Track Order"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                // Handle Back Home button press
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: screenWidth * 0.3),
              ),
              child: Text(
                "Back Home",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
