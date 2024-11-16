import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Address/address.dart';
import '../orders/ordred.dart';
import 'home_pament_page.dart';
import 'home_profile_page.dart';

class HomeAccountScreen extends StatefulWidget {
  @override
  _HomeAccountScreenState createState() => _HomeAccountScreenState();
}

class _HomeAccountScreenState extends State<HomeAccountScreen> {


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
          'Account',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.orange),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsPage() ,));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.orange),
            title: Text(
              'Orders',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Ordered() ,));

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.orange),
            title: Text(
              'Address',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Address() ,));

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.orange),
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen() ,));

            },
          ),
        ],
      ),

    );
  }
}