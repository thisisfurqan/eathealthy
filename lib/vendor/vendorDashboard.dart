import 'package:flutter/material.dart';
import 'package:eathealthy/vendor/myProfile.dart';
import 'addFood.dart';
import 'orderList.dart';
import 'cashRecieved.dart';
import 'customerFeedback.dart';


// ignore: camel_case_types
class vendorDashboard extends StatelessWidget {
  const vendorDashboard({Key? key}) : super(key: key);

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
            title: 'Add Food',
            icon: Icons.fastfood,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const addFood()),);
            },
          ),
          buildCard(
            title: 'Order List',
            icon: Icons.food_bank,
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const orderList()));
            },
          ),
          buildCard(
            title: 'Cash Received',
            icon: Icons.attach_money_rounded,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> cashRecieved()),);
            },
          ),
          buildCard(
            title: 'Customer Feedback',
            icon: Icons.account_tree_rounded,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> customerFeedback()),);
            },
          ),
        ],
      ),
    );
  }
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