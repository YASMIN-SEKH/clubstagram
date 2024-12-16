import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  ProfilePage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Profile Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            _buildProfileItem('First Name', userData['firstName']),
            _buildProfileItem('Middle Name', userData['middleName']),
            _buildProfileItem('Last Name', userData['lastName']),
            _buildProfileItem('Student Number', userData['studentNumber']),
            _buildProfileItem('Email', userData['email']),
            _buildProfileItem('Phone Number', userData['phoneNumber']),
            _buildProfileItem('Year Level', userData['yearLevel']),
            _buildProfileItem('Degree Program', userData['degreeProgram']),
            _buildProfileItem(
                'Birth Date',
                '${userData['birthMonth']} ${userData['birthDay']}, ${userData['birthYear']}'),
            SizedBox(height: 16),
            _buildListSection('Extra Curricular Activities', userData['extraCurriculars']),
            _buildListSection('Skills/Talents', userData['skills']),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value ?? 'Not Provided',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSection(String label, List<String>? items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          items != null && items.isNotEmpty
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text('- $item', style: TextStyle(color: Colors.grey[700])),
            ))
                .toList(),
          )
              : Text(
            'No $label Selected',
            style: TextStyle(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
