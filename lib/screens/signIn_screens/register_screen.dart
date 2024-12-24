import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String tag = 'registerScreen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(child: Text('Register Screen')),
    );
  }
}