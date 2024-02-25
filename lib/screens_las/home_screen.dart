import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets_las/reusable_widget.dart';
import '../utils_las/colors.dart';
import 'signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("636fa4"),
              hexStringToColor("E8CBC0")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 150, 40, 10),
                      child: Column(children: [
                        Image(
                          image: AssetImage('assets/validation.png'),
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your account has been successfully created !",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue[900],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Tap to continue or to logout",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              firebaseUIButton(context, "Logout", () {
                                FirebaseAuth.instance.signOut().then((value) {
                                  print("Signed Out");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen()));
                                });
                              }),
                              SizedBox(
                                width: 30,
                              ),
                              firebaseUIButton(context, "Continue", () {})
                            ])
                      ]))),
            )));
  }
}
