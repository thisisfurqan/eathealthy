import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
String productTitle = 'i_am_the_title_1';
final firestore = FirebaseFirestore.instance;
var loggedInUserEmail;
var loggedInUser;
var userID;

class customerFeedback extends StatefulWidget {
  const customerFeedback({super.key});

  @override
  State<customerFeedback> createState() => _customerFeedbackState();
}

class _customerFeedbackState extends State<customerFeedback> {

  void getCurrentUser() async{
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user !=null){
        loggedInUser = user;
        loggedInUserEmail=loggedInUser.email;
        userID = loggedInUser.uid;
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer FeedBack'),
      ),
      body: Container(
        margin: const EdgeInsets.all(130),
        child: ElevatedButton(onPressed: () async{
          final userDoc = await firestore.collection('Vendor').doc(userID).collection('Listings').doc('i am dosra document').set(
              {
                'title': 'I am food name',
                'description': 'I am the description of the food',
                'category': 'fast food',
                'price': '750',
                'imageUrl': 'Url of the file will be uploaded here',

              });
        }, child: const Text('Test')),
      ),
    );
  }
}
