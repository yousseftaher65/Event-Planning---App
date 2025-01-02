import 'package:event_planning_pojo/ui/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthValidationProvider extends ChangeNotifier {
  var isEmailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var isPasswordValid = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*(),.?":{}|<>_-])');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  final signInKey = GlobalKey<FormState>();

  String? validateEmailText(email) {
    if (!isEmailValid.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    if (email == null || email.isEmpty) {
      return 'Please enter your email address.';
    }
    return null;
  }

  String? validateNameText(name) {
    if (name == null || name.isEmpty) {
      return 'Please enter your name.';
    }
    return null;
  }

  String? validateRePasswordText(rePassword) {
    if (rePassword == null || rePassword.isEmpty) {
      return 'Must re-enter your password.';
    }
    if (rePassword != passwordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  String? validatePasswordText(password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password.';
    }
    if (!isPasswordValid.hasMatch(password)) {
      return 'Password must contain at least\n• one uppercase letter\n• one lowercase letter\n• one number\n• one special character.';
    }
    if (password.length < 8) {
      return '• Password must be at least 8 characters long';
    }
    return null;
  }

  AuthService authService = AuthService();

  Future<void> signUp(BuildContext context) async {
    if (signUpKey.currentState?.validate() ?? false) {
      await authService.signUp(
        context: context,
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
    }
    // notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    if (signInKey.currentState?.validate() ?? false) {
      await authService.signIn(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    }
    // notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    await authService.signInWithGoogle(context);
  }

  
  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   //rePasswordController.dispose();
  //   nameController.dispose();
  //   super.dispose();
  // }
}
