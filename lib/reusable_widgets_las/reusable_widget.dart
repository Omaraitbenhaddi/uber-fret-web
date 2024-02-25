// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../methods/common_methods.dart';

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}

TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.grey[700],
    style: TextStyle(color: Colors.grey[700]),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.blue[900],
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.grey[700], fontSize: 12),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    validator: Validators.required(' ${text} is required'),
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  CommonMethods cMethods = CommonMethods();
  checkIfNetworkIsAvailable() {
    cMethods.checkConnectivity(context);
  }

  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        checkIfNetworkIsAvailable();
        onTap();
      },
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.hovered)) {
              return Colors.blue[900];
            }
            return Colors.white;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return Colors.grey[700];
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
    ),
  );
}
