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
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: CircleAvatar(
          radius: 80,
          child: Icon(Icons.person, size: 80),
          backgroundColor: Colors.pink[200],
        ),
      ),
    );
  }
}