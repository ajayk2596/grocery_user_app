import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:grocery_user_app/views/screens/home/edit_profile.dart';
=======
import 'package:grocery_user_app/views/screens/auth/email_screen.dart';
import 'package:grocery_user_app/views/screens/home/update_profile_screen.dart';
>>>>>>> 814e0e10cc42c314df65f7391ff38d9dcaf795aa

import '../../../models/users/user_model.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              }

              if (snapshot.hasError) {
                return DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.orange),
                  child: Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Center(
                    child: Text(
                      'User not found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }

              Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
              UserModel user = UserModel.fromJson(data);

              return DrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _getBackgroundImage(user.imageUrl),
                        child: _shouldShowDefaultIcon(user.imageUrl)
                            ? const Icon(Icons.person, size: 40, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(height: 0),
                      Text(
                        user.name ?? 'Name not set',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (user.email != null)
                        Text(
                          user.email!,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      if (user.phone != null)
                        Text(
                          user.phone!,
                          style: const TextStyle(color: Colors.white70),
                        ),
                    ],
                  ),
                ),
              );

            },
          ),
          _createDrawerItem(
            icon: Icons.person,
            text: 'My Profile',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _createDrawerItem(
            icon: Icons.book,
            text: 'My Courses',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _createDrawerItem(
            icon: Icons.workspace_premium,
            text: 'Go Premium',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _createDrawerItem(
            icon: Icons.video_label,
            text: 'Saved Videos',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _createDrawerItem(
            icon: Icons.edit,
            text: 'Edit Profile',
            onTap: () {
<<<<<<< HEAD
              //Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile(),));
=======
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen() ,));
>>>>>>> 814e0e10cc42c314df65f7391ff38d9dcaf795aa
            },
          ),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Log Out',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailLoginScreen(),));
            },
          ),
        ],
      ),
    );
  }

  ImageProvider? _getBackgroundImage(dynamic imageUrl) {
    if (imageUrl == null) {
      return const AssetImage('assets/images/default_profile.png');
    }

    if (imageUrl is File) {
      return FileImage(imageUrl);
    }

    if (imageUrl is String && imageUrl.isNotEmpty) {
      return NetworkImage(imageUrl);
    }

    return const AssetImage('assets/images/default_profile.png');
  }

  bool _shouldShowDefaultIcon(dynamic imageUrl) {
    if (imageUrl == null) return true;
    if (imageUrl is File) return false;
    if (imageUrl is String) return imageUrl.isEmpty;
    return true;
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(text, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
