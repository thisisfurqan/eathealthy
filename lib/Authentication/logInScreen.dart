import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class logInScreen extends StatefulWidget {
  @override
  State<logInScreen> createState() => _logInScreenState();
}

class _logInScreenState extends State<logInScreen> {
  bool showSpinner = true;
  String Email='';
  String Password='';

  final data = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Eat Healthy'),
        // ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /************* Logo ************/
                    Image.asset(
                      'assets/main.jpg',
                      height: 150,
                      width: 150,
                    ),
                    /************* Logo Text ************/
                    const Text(
                      "Eat Healthy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                /*********** Email and password ****************/
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    Email = value;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    Password = value;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                /*************  Login/ SignUp Buttons  **********************/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final _user = await _auth.signInWithEmailAndPassword(
                                email: Email, password: Password,);
                        if(_user != null){
                          setState(() {
                            showSpinner = true;
                          });
                        }
                        try {
                          if (_user != null) {
                            final uid = _user.user?.uid;

                            // Get the Firestore instance
                            final firestore = FirebaseFirestore.instance;

                            // Retrieve the user document based on the UID
                            final userDoc = await firestore
                                .collection('Customer')
                                .doc(uid)
                                .get();
                            if (userDoc.exists) {
                              // User is a Customer
                              Navigator.pushNamed(
                                  context, '/customerDashboard');
                            } else {
                              // Retrieve the user document from the Vendor collection
                              final vendorDoc = await firestore
                                  .collection('Vendor')
                                  .doc(uid)
                                  .get();

                              if (vendorDoc.exists) {
                                // User is a Vendor
                               Navigator.pushNamed(
                                    context, '/vendorDashboard');
                              } else {
                                // Retrieve the user document from the Rider collection
                                final riderDoc = await firestore
                                    .collection('Rider')
                                    .doc(uid)
                                    .get();

                                if (riderDoc.exists) {
                                  // User is a Rider
                                  Navigator.pushNamed(context, '/riderDashboard');
                                } else {
                                  print('No Navigation found');
                                }
                              }
                            }
                          }
                        }
                        catch(e){
                          print('exception catched = $e');
                        }
                        /**** close here catch error  ***********/
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signUpScreen');
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
    );
  }
}
