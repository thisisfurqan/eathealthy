import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'OrderFoodCard.dart';

class orderFood extends StatelessWidget {
  const orderFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Food'),
      ),
      body: OrderFoodCard(),
    );
  }
}


