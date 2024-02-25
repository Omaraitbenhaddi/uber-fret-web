import 'package:flutter/material.dart';

TextFormField reusableTextValidatePasswordField(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
  TextEditingController confirmController,
) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    keyboardType: TextInputType.visiblePassword,
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
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    validator: (val) => validatePassword(val!, confirmController),
  );
}

String? validatePassword(
    String value, TextEditingController confirmController) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter a Strong Valid Password';
    } else if (value != confirmController.text) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }
}
