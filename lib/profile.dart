import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  void _showChangePasswordModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangePasswordModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: _buildChangePasswordButton(context),
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

  Widget _buildChangePasswordButton(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.lock, color: Colors.pink),
      title: Text('Change Password'),
      subtitle: Text('Update your account security'),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        _showChangePasswordModal(context);
      },
    );
  }

  Widget _buildPersonalInfoSection() {
    return Column(
      children: [
        _buildInfoItem('Email', 'danieldeasis@example.com'),
        _buildInfoItem('Phone', '+1 (555) 123-4567'),
        _buildInfoItem('Address', 'Poblacion 5 Calacan City, Batangas'),
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
          backgroundColor: Colors.pink,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 18,
          color:Colors.white,
          ),
          
        ),
        onPressed: () {},
      ),
    );
  }
}

class ChangePasswordModal extends StatefulWidget {
  @override
  _ChangePasswordModalState createState() => _ChangePasswordModalState();
}

class _ChangePasswordModalState extends State<ChangePasswordModal> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                _buildPasswordField(
                  controller: _currentPasswordController,
                  label: 'Current Password',
                  obscureText: _obscureCurrentPassword,
                  onToggleObscure: () {
                    setState(() {
                      _obscureCurrentPassword = !_obscureCurrentPassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildPasswordField(
                  controller: _newPasswordController,
                  label: 'New Password',
                  obscureText: _obscureNewPassword,
                  onToggleObscure: () {
                    setState(() {
                      _obscureNewPassword = !_obscureNewPassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  label: 'Confirm New Password',
                  obscureText: _obscureConfirmPassword,
                  onToggleObscure: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  validator: (value) {
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                _buildPasswordRequirements(),
                SizedBox(height: 24),
                _isLoading
                    ? Center(child: CircularProgressIndicator(color: Colors.pink))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _submitForm,
                        child: Text(
                          'Update Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback onToggleObscure,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: onToggleObscure,
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordRequirements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password Requirements:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        Text('• At least 8 characters long'),
        Text('• Should contain letters and numbers'),
        Text('• Avoid common passwords'),
      ],
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password changed successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Close the modal
      Navigator.of(context).pop();
    }
  }
}