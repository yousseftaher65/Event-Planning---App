import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const InputField(
      {super.key,
      required this.label,
      required this.icon,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).indicatorColor,
      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
      ),
    );
  }
}
