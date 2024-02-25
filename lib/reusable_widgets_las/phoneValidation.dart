import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

TextFormField reusablePhoneField(String text, IconData icon,
    bool isPasswordType, TextEditingController controller) {
  return TextFormField(
      controller: controller,
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
      validator: Validators.compose([
        Validators.required(' ${text} is required'),
        Validators.patternRegExp(RegExp(r"^0\d*$"), 'Only numbers are allowed'),
        Validators.minLength(10, 'Phone cannot be less than 10 numbers'),
        Validators.maxLength(10, 'Phone cannot be greater than 10 numbers'),
      ]));
}
