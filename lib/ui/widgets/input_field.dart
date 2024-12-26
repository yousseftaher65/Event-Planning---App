import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  const InputField({super.key , required this.label , required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      inputFormatters: [
       LengthLimitingTextInputFormatter(30),
      ],
      // validator: (value) {
        
      // },
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
      ),
    );
  }
}