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
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: _buildProfileHeader(),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: _buildStatsRow(),
                ),
              ),
              SizedBox(height: 16),
              _buildSectionCard(
                title: 'Personal Preferences',
                child: _buildPersonalPreferencesSection(),
              ),
              SizedBox(height: 16),
              _buildSectionCard(
                title: 'Account Security',
                child: _buildChangePasswordButton(),
              ),
              SizedBox(height: 16),
              _buildSectionCard(
                title: 'Personal Information',
                child: _buildPersonalInfoSection(),
              ),
              SizedBox(height: 16),
              _buildSectionCard(
                title: 'Notifications',
                child: _buildNotificationSettingsSection(),
              ),
              SizedBox(height: 16),
              _buildEditProfileButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink[800],
              ),
            ),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          child: Icon(Icons.person, size: 40),
          backgroundColor: Colors.grey[300],
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
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      children: [
        _buildPreferenceItem(Icons.favorite, 'Favorites', 'View your saved items'),
        _buildPreferenceItem(Icons.style, 'Style Preferences', 'Update your style choices'),
        _buildPreferenceItem(Icons.notifications_active, 'Reminders', 'Manage appointment reminders'),
      ],
    );
  }

  Widget _buildPreferenceItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.pink),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildChangePasswordButton() {
    return ListTile(
      leading: Icon(Icons.lock, color: Colors.pink),
      title: Text('Change Password'),
      subtitle: Text('Update your account security'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      children: [
        _buildInfoItem('Email', 'daniel.deasis@example.com'),
        _buildInfoItem('Phone', '+1 (555) 123-4567'),
        _buildInfoItem('Address', '123 Beauty St, Salon City'),
        _buildInfoItem('Birthday', 'January 15, 1990'),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSettingsSection() {
    return Column(
      children: [
        SwitchListTile(
          title: Text('Appointment Reminders'),
          subtitle: Text('Get notifications for upcoming appointments'),
          value: true,
          onChanged: (value) {},
          activeColor: Colors.pink,
        ),
        SwitchListTile(
          title: Text('Promotional Offers'),
          subtitle: Text('Receive special offers and discounts'),
          value: false,
          onChanged: (value) {},
          activeColor: Colors.pink,
        ),
        SwitchListTile(
          title: Text('New Services'),
          subtitle: Text('Be notified about new services'),
          value: true,
          onChanged: (value) {},
          activeColor: Colors.pink,
        ),
      ],
    );
  }

  Widget _buildEditProfileButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.pink,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {},
      ),
    );
  }
}