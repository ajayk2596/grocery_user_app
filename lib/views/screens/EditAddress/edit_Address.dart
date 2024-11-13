import 'package:flutter/material.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Edit Address', style: TextStyle(color: Colors.orange, fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.04),
              _buildTextField("Address Type", "Home", true),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField("Street Address", "Mati egh"),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField("City", "Goteborg", true),
              SizedBox(height: screenHeight * 0.03),
              _buildTextField("Area", "Lungangen"),
              SizedBox(height: screenHeight * 0.15),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    "Update Address",
                    style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, [bool hasDropdown = false]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.orange[700], fontSize: 16, fontWeight: FontWeight.w500),
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.grey[200],
            child: Card(
              elevation: 2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  border: InputBorder.none,
                  suffixIcon: hasDropdown ? Icon(Icons.arrow_drop_down_sharp, color: Colors.orange) : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
