import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

TextFormField reusableMailField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextFormField(
      controller: controller,
      obscureText: isPasswordType,
      keyboardType: TextInputType.emailAddress,
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
        Validators.email('Invalid email address'),
      ]));
}
