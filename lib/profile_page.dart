import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _deleteProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Profile"),
        content: const Text("Are you sure you want to delete your profile?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('images/travel.webp'),
              radius: 40,
            ),
            const SizedBox(height: 16),
            const ListTile(leading: Icon(Icons.person), title: Text("Srujan")),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("srujan@example.com"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text("Delete Profile"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => _deleteProfile(context),
            ),
          ],
        ),
      ),
    );
  }
}
