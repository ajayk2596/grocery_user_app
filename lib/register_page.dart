import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_user_app/views/screens/auth/email_screen.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'controllers/provider/users/user_controller.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final String userId = "unique_user_id";
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showImageSourceDialog(UserController data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Please Choose Your Image"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                data.pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                data.pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back, color: Colors.orange)),
        title: Text("Register",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _showImageSourceDialog(data),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: data.profileImage != null
                        ? FileImage(data.profileImage!)
                        : (data.userData?.imageUrl != null
                        ? NetworkImage(data.userData!.imageUrl!)
                        : null) as ImageProvider?,
                    child: data.profileImage == null &&
                        (data.userData?.imageUrl == null)
                        ? Icon(Icons.person, size: 60, color: Colors.grey)
                        : null,
                  ),
                  if (data.profileImage == null &&
                      (data.userData?.imageUrl == null))
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.orange,
                        size: 24,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
                nameController, 'Name', Icons.person, TextInputType.name, null),
            SizedBox(height: 15),
            _buildTextField(emailController, 'Email', Icons.email,
                TextInputType.emailAddress, null),
            SizedBox(height: 15),
            _buildTextField(
                phoneController, 'Phone', Icons.phone, TextInputType.phone, 10),
            SizedBox(height: 15),
            _buildPasswordTextField(passwordController, 'Password'),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await data.userSignUp(
                    context: context,
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    phone: phoneController.text,
                    imageFile: data.profileImage,
                  );

                  // Reset the profile image to show default if no image was selected
                  if (data.profileImage == null) {
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Save',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmailLoginScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String hintText,
      IconData icon,
      TextInputType keyboardType,
      int? maxLength) {
    return Card(
      elevation: 2,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.orange),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          counterText: "", // Hide the counter text
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(
      TextEditingController controller, String hintText) {
    return Card(
      elevation: 2,
      child: TextField(
        controller: controller,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(Icons.lock, color: Colors.orange),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.orange,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
