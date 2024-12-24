import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key ,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      // validator: (value) {
        
      // },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_rounded),
        labelText: "Password",
        suffixIcon: Icon(Icons.visibility_off_rounded , color: Theme.of(context).inputDecorationTheme.prefixIconColor,),
      ),
    );
  }
}