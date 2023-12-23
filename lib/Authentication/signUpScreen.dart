import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum UserType {
  Customer,
  Vendor,
  Rider,
}

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final _user = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  UserType? _UserType;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /********************  Welcome Screen text  ***************/
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/main.jpg',
                        height: 150,
                        width: 150,
                      ),
                      const Text(
                        "Eat Healthy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                  /******************  Input text Fields  ******************/
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      /*********** Email and password ****************/
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // You can also add more validation rules here
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          // You can also add more validation rules here
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /******* Radio Buttons ************/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RadioListTile(
                          dense: true,
                          title: const Text(
                            "Customer",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          value: UserType.Customer,
                          groupValue: _UserType,
                          onChanged: (value) {
                            setState(() {
                              _UserType = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          dense: true,
                          title: const Text(
                            "Vendor",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          value: UserType.Vendor,
                          groupValue: _UserType,
                          onChanged: (value) {
                            setState(() {
                              _UserType = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RadioListTile(
                          dense: true,
                          title: const Text(
                            "Rider",
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          value: UserType.Rider,
                          groupValue: _UserType,
                          onChanged: (value) {
                            setState(() {
                              _UserType = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  /*************  Login/ SignUp Buttons  **********************/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Log In'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          /****** Setting User Id (uid) and Collection Id same **********/
                          // Get the id of new user
                          final uid = newUser.user?.uid;
                          //print('The new user Id is = $uid');
                          // Get the Firestore instance
                          final firestore = FirebaseFirestore.instance;

                          // Check the customer type for "Customer"

                          if (_UserType == UserType.Customer) {
                            // Define a custom UID
                            final customUid = uid;

                            // Create a new document with the custom UID
                            final docRef = firestore
                                .collection('Customer')
                                .doc(customUid);

                            // Set data in the document
                            await docRef.set({
                              'Email': email,
                              'Password': password,
                              'UserType': 'Customer',
                            });
                         }

                          // Check the customer type for "Vendor"

                          if (_UserType == UserType.Vendor) {
                            // Define a custom UID
                            final customUid = uid;

                            // Create a new document with the custom UID
                            final docRef = firestore
                                .collection('Vendor')
                                .doc(customUid);

                            // Set data in the document
                            await docRef.set({
                              'Email': email,
                              'Password': password,
                              'UserType': 'Vendor',
                            });
                          }

                          // Check the customer type for "Rider"

                          if (_UserType == UserType.Rider) {
                            // Define a custom UID
                            final customUid = uid;

                            // Create a new document with the custom UID
                            final docRef = firestore
                                .collection('Rider')
                                .doc(customUid);

                            // Set data in the document
                            await docRef.set({
                              'Email': email,
                              'Password': password,
                              'UserType': 'Rider',
                            });
                          }

                          },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/******* old code of registering users *******/
//   } else if (_UserType == UserType.Vendor) {
//     _user.collection('Vendor').add({
//       'Email': email,
//       'Type': 'Vendor',
//       'Password': password,
//     });
//   } else if (_UserType == UserType.Rider) {
//     _user.collection('Rider').add({
//       'Email': email,
//       'Type': 'Rider',
//       'Password': password,
//     });