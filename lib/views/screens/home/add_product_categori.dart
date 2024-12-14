import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  bool _isAvailable = true;
  bool _isFeatured = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Create a unique ID for the product
      final productId = DateTime.now().millisecondsSinceEpoch.toString();

      // Product data
      final productData = {
        "id": productId,
        "name": _nameController.text,
        "description": _descriptionController.text,
        "imageUrl": _imageUrlController.text,
        "price": double.tryParse(_priceController.text) ?? 0.0,
        "isAvailable": _isAvailable,
        "isFeatured": _isFeatured,
        "categoryId": "123456", // Example category ID
        "stockQuantity": 100,  // Example stock quantity
        "createdDate": DateTime.now().toIso8601String(),
      };

      try {
        // Add to Firestore
        await FirebaseFirestore.instance
            .collection('sdcategories')
            .doc(productId)
            .set(productData);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Product Added Successfully!")),
        );

        // Clear the form
        _formKey.currentState!.reset();
        setState(() {
          _isAvailable = true;
          _isFeatured = false;
        });
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add product: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: screenHeight * 0.02),
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Product Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the product name.";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              // Description Field
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the product description.";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              // Price Field
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the price.";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid number.";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              // Image URL Field
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: "Image URL",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the image URL.";
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              // Availability Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Is Available",
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                  Switch(
                    value: _isAvailable,
                    onChanged: (value) {
                      setState(() {
                        _isAvailable = value;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                ],
              ),
              // Featured Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Is Featured",
                    style: TextStyle(fontSize: screenWidth * 0.045),
                  ),
                  Switch(
                    value: _isFeatured,
                    onChanged: (value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Add Product",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


