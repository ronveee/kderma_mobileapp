import 'package:flutter/material.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  final Color lightPink = const Color(0xFFFFF5F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPink,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dashboard Overview",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  dashboardCard(
                    "Total Appointments",
                    "128",
                    "+14% from last month",
                    Icons.calendar_today,
                  ),
                  dashboardCard(
                    "Total Service Avail",
                    "18",
                    "+3 new this month",
                    Icons.assignment_turned_in,
                  ),
                  dashboardCard(
                    "Upcoming Schedule",
                    "7",
                    "+2 for this week",
                    Icons.schedule,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget dashboardCard(
      String title, String value, String subtitle, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(fontSize: 10, color: Colors.green)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.pink.shade50,
            child: Icon(icon, color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
