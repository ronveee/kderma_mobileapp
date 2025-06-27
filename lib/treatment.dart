import 'package:flutter/material.dart';

// Add these placeholder classes if not already defined elsewhere
class NavItem {
  final IconData icon;
  final String label;
  NavItem({required this.icon, required this.label});
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Page'));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}

class SkincareServicesSection extends StatelessWidget {
  const SkincareServicesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Skincare Services'));
  }
}

class TreatmentTimelineSection extends StatelessWidget {
  const TreatmentTimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final treatments = [
      {
        'treatmentName': 'Facial Treatment',
        'date': 'June 27, 2025',
        'status': 'Completed',
      },
      {
        'treatmentName': 'Acne Therapy',
        'date': 'July 5, 2025',
        'status': 'Scheduled',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Treatment Timeline',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Track your skincare treatments and progress',
            style: TextStyle(fontSize: 16, color: Colors.pink),
          ),
          const SizedBox(height: 24),
          ...treatments.map((t) => TreatmentTimelineItem(
                treatmentName: t['treatmentName']!,
                date: t['date']!,
                status: t['status']!,
              )),
        ],
      ),
    );
  }
}

class TreatmentTimelineItem extends StatelessWidget {
  final String treatmentName;
  final String date;
  final String status;

  const TreatmentTimelineItem({
    Key? key,
    required this.treatmentName,
    required this.date,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(treatmentName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Text(status, style: TextStyle(color: status == 'Completed' ? Colors.green : Colors.orange)),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(icon: Icons.dashboard, label: 'Dashboard'),
    NavItem(icon: Icons.person, label: 'Profile'),
    NavItem(icon: Icons.medical_services, label: 'Services'),
    NavItem(icon: Icons.calendar_today, label: 'My Appointments'),
    NavItem(icon: Icons.history, label: 'Treatment History'),
  ];

  final List<Widget> _pages = [
    HomeContent(), // Dashboard
    ProfilePage(), // Profile
    SkincareServicesSection(), // Services
    Center(child: Text('My Appointments')), // My Appointments
    TreatmentTimelineSection(), // Treatment History
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('K DERMA')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ..._navItems.asMap().entries.map((entry) {
              int idx = entry.key;
              NavItem item = entry.value;
              return ListTile(
                leading: Icon(item.icon),
                title: Text(item.label),
                selected: idx == _selectedIndex,
                onTap: () {
                  setState(() {
                    _selectedIndex = idx;
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}