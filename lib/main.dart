import 'package:flutter/material.dart';
import 'package:eathealthy/Authentication//logInScreen.dart';
import 'Authentication/signUpScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'customer/customerDashboard.dart';
import 'vendor/vendorDashboard.dart';
import 'rider/riderdashboard.dart';
import 'customer/myProfile.dart';
import 'customer/orderfood.dart';
import 'customer/orderTracking.dart';
import 'customer/orderHistory.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => logInScreen(),
        '/signUpScreen': (context) => signUpScreen(),
        '/customerDashboard': (context) => customerDashboard(),
        '/vendorDashboard': (context) => vendorDashboard(),
        '/riderDashboard': (context) => riderDashboard(),
        /*********** Customer **************/
        '/myProfile.cu': (context) => myProfile(),
        '/orderFood.cu': (context) => orderFood(),
        '/orderTracking.cu': (context) => orderTracking(),
        '/orderHistory.cu': (context) => orderHistory(),

        /********** Vendor **************/


        '/orderFood.cu': (context) => orderFood(),
        '/orderTracking.cu': (context) => orderTracking(),
        '/orderHistory.cu': (context) => orderHistory(),
      },
    );
  }
}



