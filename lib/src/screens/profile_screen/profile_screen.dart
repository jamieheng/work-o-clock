import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/iu_pf.jpg'),
            ),
            const SizedBox(height: 16),
            // Name
            const Text(
              'Naksu In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            // Position
            const Text(
              'Senior Mobile Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Email
            const Text(
              'haein@melonpeach.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            // Phone Number
            const Text(
              '+855 11 999 777',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            // More Sections
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.apps),
              title: const Text('App'),
              onTap: () {
                // Handle app tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.video_call),
              title: const Text('Tutorial'),
              onTap: () {
                // Handle tutorial tap
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                // Handle logout tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
