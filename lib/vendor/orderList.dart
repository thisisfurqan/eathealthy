import 'package:flutter/material.dart';
import 'orderListCard.dart';

class orderList extends StatelessWidget {
  const orderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders List'),
      ),
      body: orderListCard(),
    );
  }
}

///orderListCard

// class orderListCard extends StatelessWidget {
//   const orderListCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       height: 190,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.blue,
//       ),
//       child: Stack(
//         children: [
//           Container(
//               margin: const EdgeInsets.all(5),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: const Image(
//                   image: AssetImage('assets/main.jpg'),
//                   height: 100,
//                   width: 100,
//                 ),
//               )),
//           Container(
//             margin: const EdgeInsets.only(top: 10, right: 2, left: 110),
//             child: const Text(
//               'Hello! I am the title of your Product order',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//
//           ///Price
//           Container(
//             margin: const EdgeInsets.only(top: 65, right: 2, left: 110),
//             child: const Text(
//               '730',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//
//           ///Buttons
//           Container(
//             margin: const EdgeInsets.only(top: 120, left: 45),
//             child: Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   child: const Text("Accept"),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   child: const Text("Reject"),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
//                   child: const Text("Details"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
