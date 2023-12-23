/// This will handle all the firebase events of the customer side

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

/// Getting Food Data from firebase.

Stream<List<Map<String, dynamic>>> getFoodData() {
  return FirebaseFirestore.instance
      .collectionGroup('Listings') // This will search through all collections named 'Listings' under 'Vendor'
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  });
}

/// Uploading Order Details to the relevant Vendor

Future uploadOrderData (String title, description, price, imageUrl, vendorID) async {
  String  orderID= DateTime.now().millisecondsSinceEpoch.toString();
  String customerID = await getCustomerID();
await FirebaseFirestore.instance
      .collection('Vendor')
      .doc(vendorID)
      .collection('Orders').doc(orderID)
      .set({
    'title': title,
    'description': description,
    'price': price,
    'imageUrl': imageUrl,
    'customerID': customerID,
  });
}

//Getting Current (Logged in user) Customer ID

Future<String> getCustomerID() async {
  final user = await FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  }
  // Return a default or handle the case when the user is not logged in
  return 'unknown_customer';
}
