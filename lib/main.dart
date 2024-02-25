import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dashboard/side_navigation_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA7BvJqWNcdlm0iDXabdErU-HaIG8E5qsg",
        authDomain: "uber-5049e.firebaseapp.com",
        databaseURL:
            "https://uber-5049e-default-rtdb.europe-west1.firebasedatabase.app",
        projectId: "uber-5049e",
        storageBucket: "uber-5049e.appspot.com",
        messagingSenderId: "601275560805",
        appId: "1:601275560805:web:22a7daf7132071bd3fe78c",
        measurementId: "G-PZTBMWT3Z0"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const SideNavigationDrawer(),
    );
  }
}
