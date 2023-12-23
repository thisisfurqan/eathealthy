import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

//This will return the stream of the active Orders from firebase
Stream<List<Map<String, dynamic>>> getOrderData()  async*{
  String vendorID = await getVendorID();
  yield* FirebaseFirestore.instance
      .collection('Vendor')
      .doc(vendorID)
      .collection(
          'Orders') // This will search through all collections named 'Listings' under 'Vendor'
      .snapshots()
      .map((snapshot) {
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  });
}

//Getting Current (Logged in Vendor) Vendor ID

Future<String> getVendorID() async {
  final user = await FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  }
  // Return a default or handle the case when the user is not logged in
  return 'unknown_Vendor';
}
