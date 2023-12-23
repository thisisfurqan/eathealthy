import 'package:flutter/material.dart';


class cashRecieved extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash Recieved'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, left: 40),
              child: const Column(
                children: [
                  Text('Pending Payment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
                  SizedBox(height: 10,),
                  Text('7050', style: TextStyle(fontSize: 30,),),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(top: 5, left: 40),
              child: const Column(
                children: [
                  Text('Payment Received', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),),
                  SizedBox(height: 10,),
                  Text('35400', style: TextStyle(fontSize: 30,),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
