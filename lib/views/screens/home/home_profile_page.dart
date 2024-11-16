import 'package:flutter/material.dart';

import '../auth/change_password_screen.dart';
import '../../../edite_profile_page.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {

  bool isNotificationsEnabled = true;
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person, color: Colors.orange),
              title: Text("Edit Profile"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(),));
                // Navigate to Edit Profile Screen
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_key, color: Colors.orange),
              title: Text("Change Password"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen(),));

                // Navigate to Change Password Screen
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card, color: Colors.orange),
              title: Text("My Cards"),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
              onTap: () {
                // Navigate to My Cards Screen
              },
            ),
            SizedBox(height: 20),

            // App Settings Section
            Text(
              "App Settings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.orange),
              title: Text("Notifications"),
              trailing: Switch(
                value: isNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    isNotificationsEnabled = value;
                  });
                },
                activeColor: Colors.orange,
              ),
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.orange),
              title: Text("Language"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(selectedLanguage),
                  Icon(Icons.arrow_forward_ios, color: Colors.orange),
                ],
              ),
              onTap: () {
                // Language selection dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Language'),
                      content: DropdownButton<String>(
                        value: selectedLanguage,
                        items: <String>['English', 'Hindi', 'Spanish']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedLanguage = newValue!;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.orange),
              title: Text("Logout"),
              onTap: () {
                // Logout logic
              },
            ),
          ],
        ),
      ),

    );
  }
}
