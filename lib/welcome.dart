import 'package:flutter/material.dart';
import 'profile.dart';

class WelcomePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  WelcomePage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${userData['firstName']}!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(userData: userData),
                  ),
                );
              },
              child: Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
