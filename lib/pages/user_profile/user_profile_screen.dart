import 'package:checkup/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/add_family_member');
            },
            child: const Text('Add Family Member'),
          ),
          ElevatedButton(
            onPressed: () {
              AuthService().signOut();
              Get.offAllNamed('/login');
            },
            child: const Text('Logout'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/edit_profile');
              },
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
