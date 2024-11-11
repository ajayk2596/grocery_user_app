import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../controllers/provider/users/user_controller.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  bool isLoading = false;

  // Future<void> _updateProfile() async {
  //   setState(() {
  //     isLoading = true; // Show CircularProgressIndicator
  //   });
  //
  //   await userController.updateUserProfile(
  //     uid: userData.uid.toString(),
  //     name: _nameController.text,
  //     email: _emailController.text,
  //     phone: _phoneController.text,
  //     imageFile: _imageFile,
  //     context: context,
  //     password: '',
  //   );
  //
  //   setState(() {
  //     isLoading = false; // Hide CircularProgressIndicator after operation completes
  //   });
  // }


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _imageFile;

  @override
  void initState() {
    super.initState();

    final userData = Provider.of<UserController>(context, listen: false).userData;
    if (userData != null) {
      _nameController.text = userData.name ?? '';
      _emailController.text = userData.email ?? '';
      _phoneController.text = userData.phone ?? '';
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog(UserController userController) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Choose an Image"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    final userData = userController.userData;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.orange, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: userData == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: _imageFile != null
                      ? FileImage(_imageFile!)
                      : (userData.imageUrl != null && userData.imageUrl!.isNotEmpty
                      ? NetworkImage(userData.imageUrl!)
                      : AssetImage('assets/default_avatar.png')) as ImageProvider,
                  child: _imageFile == null &&
                      (userData.imageUrl == null || userData.imageUrl!.isEmpty)
                      ? Icon(Icons.person, size: 60, color: Colors.grey)
                      : null,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                       _showImageSourceDialog(userController);
                    },
                    icon: Icon(Icons.edit, color: Colors.orange),
                  ),
                ),
              ],
            ),


            SizedBox(height: 20),
            _buildTextField(_nameController, 'Name', Icons.person),
            SizedBox(height: 15),
            _buildEmailField(), // Updated email field with readOnly
            SizedBox(height: 15),
            _buildTextField(_phoneController, 'Phone', Icons.phone),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true; // Start loading
                  });

                  await userController.updateUserProfile(
                    uid: userData.uid.toString(),
                    name: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    imageFile: _imageFile,
                    context: context,
                    password: '',
                  );

                  setState(() {
                    isLoading = false; // Stop loading
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white) // Show progress indicator
                    : Text('Update Profile', style: TextStyle(fontSize: 16, color: Colors.white)), // Show text when not loading
              ),
            )

            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       await userController.updateUserProfile(
            //         uid: userData.uid.toString(),
            //         name: _nameController.text,
            //         email: _emailController.text,
            //         phone: _phoneController.text,
            //         imageFile: _imageFile,
            //         context: context, password: '',
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //       padding: EdgeInsets.symmetric(vertical: 16),
            //       backgroundColor: Colors.orange,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12.0),
            //       ),
            //     ),
            //     child: Text('Update Profile', style: TextStyle(fontSize: 16, color: Colors.white)),
            //   ),
            //
            // ),

          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.orange),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: TextField(
        controller: _emailController,
       readOnly: true, // Making the field read-only
        onTap: () {
          // Optional: Show a dialog or a message that email cannot be edited
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email cannot be edited.")),
          );
        },
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email, color: Colors.orange),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
