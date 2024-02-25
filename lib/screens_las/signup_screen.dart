// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets_las/mailValidation.dart';
import '../reusable_widgets_las/passwordValidator.dart';
import '../reusable_widgets_las/phoneValidation.dart';
import '../reusable_widgets_las/reusable_widget.dart';
import '../utils_las/colors.dart';
import 'home_screen.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("636fa4"),
            hexStringToColor("E8CBC0")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Form(
            key: form,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 150, 40, 10),
                  child: Column(children: [
                    Text(
                      "Create A user Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Create account so you can explore all of the existing drivers to your location !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    reusableTextField(
                        "First Name",
                        Icons.account_circle_rounded,
                        false,
                        _firstNameTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Last Name", Icons.account_circle_rounded,
                        false, _lastNameTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableMailField("Email Adress", Icons.email_outlined,
                        false, _emailTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusablePhoneField("Phone Number", Icons.phone, false,
                        _phoneTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextValidatePasswordField(
                        "Password",
                        Icons.lock_outline,
                        true,
                        _passwordTextController,
                        _confirmPasswordTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextValidatePasswordField(
                        "Confirm Password",
                        Icons.lock_outline,
                        true,
                        _confirmPasswordTextController,
                        _passwordTextController),
                    SizedBox(
                      height: 80,
                    ),
                    firebaseUIButton(
                      context,
                      "Sign up",
                      () async {
                        if (form.currentState != null &&
                            form.currentState!.validate()) {
                          final User? userFirebase =
                              (await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                            email: _emailTextController.text.trim(),
                            password: _passwordTextController.text.trim(),
                          )
                                      .catchError((errorMsg) {
                            Navigator.pop(context);
                          }))
                                  .user;

                          Navigator.pop(context);

                          if (userFirebase != null) {
                            DatabaseReference usersRef = FirebaseDatabase
                                .instance
                                .ref()
                                .child("users")
                                .child(userFirebase.uid);

                            Map userDataMap = {
                              "First Name":
                                  _firstNameTextController.text.trim(),
                              "Last Name": _lastNameTextController.text.trim(),
                              "email": _emailTextController.text.trim(),
                              "phone": _phoneTextController.text.trim(),
                              "id": userFirebase.uid,
                              "blockStatus": "no", //Approoved account by Admin
                            };
                            await usersRef.set(userDataMap);

                            displayToastMessage(
                                "New user account has been successfully created",
                                context); //Set information to dataBase

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            displayToastMessage(
                                "New user account cannot be created", context);
                          }
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?",
                            style: TextStyle(color: Colors.black87)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => SignInScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  ])),
            ),
          ),
        ));
  }
}
