import 'package:flutter/material.dart';
import 'orderTracking.dart';

Container orderHistoryCard(BuildContext context) {
  return Container(
    height: 100,
    width: double.infinity,
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xff80B3FF),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 100, top: 10),
          child: const Text('I am the title of the food', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),
        ClipRRect(
          borderRadius:
          BorderRadius.circular(10), // Adjust the radius as needed
          child: const Image(
            image: AssetImage('assets/main.jpg'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 100, top: 37),
          child: const Text('31-oct-2023', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Container(
          margin: const EdgeInsets.only(left: 270, top: 37),
          child: const Text('430', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Container(
          margin: const EdgeInsets.only(left: 100, top: 65),
          child: const Text('In Progresss', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        ),
        Container(
            margin: const EdgeInsets.only(left: 210, top: 55),
            child:  ElevatedButton(child: const Text('View Details', style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),  onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const orderTracking()),);
            },)
        ),
      ],
    ),
  );
}