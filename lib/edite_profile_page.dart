import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _phoneController = TextEditingController();
  String? _completePhoneNumber;
  String _selectedCountry = "🇸🇪";
  String _phoneNumber = "+46 707 07 07";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            // Handle back action
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'mati egh',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildPhoneField(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle update profile action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Update Profile', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          DropdownButton<String>(
            value: _selectedCountry,
            items: [
              DropdownMenuItem(
                child: Text("🇸🇪"),
                value: "🇸🇪",
              ),
              DropdownMenuItem(
                child: Text("🇺🇸"),
                value: "🇺🇸",
              ),
              DropdownMenuItem(
                child: Text("🇮🇳"),
                value: "🇮🇳",
              ),
            ],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value!;
              });
            },
            underline: SizedBox(),
          ),
          SizedBox(width: 8),
          IntlPhoneField(
            controller: _phoneController,
            decoration: InputDecoration(
              hintText: "Phone Number",

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            initialCountryCode: 'IN', // Default country code (India)
            onChanged: (phone) {
              setState(() {
                _completePhoneNumber = phone.completeNumber; // Get the full phone number with country code
              });
              print(_completePhoneNumber); // Optional: Log the full phone number
            },
          ),
        ],
      ),
    );
  }
}
