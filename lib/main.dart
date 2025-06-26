import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        color: Colors.pink[50],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              SizedBox(height: 24),
              _buildStatsRow(),
              SizedBox(height: 24),
              _buildPersonalPreferencesSection(),
              SizedBox(height: 24),
              _buildChangePasswordButton(),
              SizedBox(height: 24),
              _buildPersonalInfoSection(),
              SizedBox(height: 24),
              _buildNotificationSettingsSection(),
              SizedBox(height: 24),
              _buildEditProfileButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/43.jpg'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Daniel De Asis',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Client',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Member since 1/15/2024',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem('8', 'Appointments'),
        _buildStatItem('2', 'Products'),
        _buildStatItem('3', 'Services'),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPersonalPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Preferences',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        _buildPreferenceItem(
          title: 'Preferred Days',
          values: ['Tuesday', 'Thursday'],
        ),
        SizedBox(height: 12),
        _buildPreferenceItem(
          title: 'Preferred Times',
          values: ['Morning', 'Afternoon'],
        ),
        SizedBox(height: 12),
        _buildPreferenceItem(
          title: 'Favorite Treatments',
          values: ['Advanced Facial Treatment', 'Anti-Aging Treatments'],
        ),
      ],
    );
  }

  Widget _buildPreferenceItem({required String title, required List<String> values}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: values.map((value) => Chip(
            label: Text(value),
            backgroundColor: Colors.pink[100],
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildChangePasswordButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Change Password'),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.pink[300], // Changed from primary to backgroundColor
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Information',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        _buildInfoItem('Full Name', 'Daniel De Asis'),
        _buildInfoItem('Email Address', 'danieldeasis@gmail.com'),
        _buildInfoItem('Phone Number', '(555) 123-4567'),
        SizedBox(height: 12),
        _buildInfoItem('Skin Type', 'Combination'),
        _buildInfoItem('Skin Concerns', 'Fine Lines, Dryness, Sensitivity'),
        _buildInfoItem('Allergies & Sensitivities', 'None reported'),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Notification Settings',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12),
        _buildSwitchItem('Appointment Reminders', 'Get notified about upcoming appointments', true),
        _buildSwitchItem('Text Notifications', 'Receive notifications via text message', true),
        _buildSwitchItem('Promotional Emails', 'Receive emails about promotions and special offers', true),
        _buildSwitchItem('Newsletter Subscription', 'Receive our monthly newsletter', true),
      ],
    );
  }

  Widget _buildSwitchItem(String title, String subtitle, bool value) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (bool newValue) {},
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Edit Profile'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.pink[300], // Changed from primary to backgroundColor
        ),
      ),
    );
  }
}