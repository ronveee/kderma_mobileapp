import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K DERMA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // My Appointments is selected by default

  final List<NavItem> _navItems = [
    NavItem(icon: Icons.person, label: 'Profile'),
    NavItem(icon: Icons.medical_services, label: 'Services'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'K DERMA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        
      ),
      body: Center(
        child: Text(
          'Content for ${_navItems[_selectedIndex].label}',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Daniel De Asis'),
              accountEmail: Text('Client'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/1.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _navItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(_navItems[index].icon),
                    title: Text(_navItems[index].label),
                    selected: index == _selectedIndex,
                    selectedTileColor: Colors.blue.withOpacity(0.1),
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});
}