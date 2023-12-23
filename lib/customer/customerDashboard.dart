import 'package:flutter/material.dart';
import 'myProfile.dart';
import 'orderfood.dart';
import 'orderTracking.dart';
import 'orderHistory.dart';


class customerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Number of cards in each row
        padding: const EdgeInsets.all(16.0),
        children: [
          buildCard(
            title: 'My Profile',
            icon: Icons.person,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> myProfile()),);
            },
          ),
          buildCard(
            title: 'Order Food',
            icon: Icons.fastfood,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const orderFood()),);
            },
          ),
          buildCard(
            title: 'Order Tracking',
            icon: Icons.track_changes,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const orderTracking()),);
            },
          ),
          buildCard(
            title: 'Order History',
            icon: Icons.history,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const orderHistory()),);
            },
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

