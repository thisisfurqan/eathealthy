import 'package:flutter/material.dart';
import 'orderHistoryCard.dart';

class orderHistory extends StatelessWidget {
  const orderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            orderHistoryCard(context),
            orderHistoryCard(context),
            orderHistoryCard(context),
            orderHistoryCard(context),
            orderHistoryCard(context),
            orderHistoryCard(context),
            orderHistoryCard(context),
            orderHistoryCard(context),
          ],
        ),
      ),
    );
  }
}
