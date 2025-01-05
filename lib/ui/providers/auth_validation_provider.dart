import 'package:easy_localization/easy_localization.dart';
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
    if (email == null || email.isEmpty) {
      return "please_enter_email".tr();
    }
    if (!isEmailValid.hasMatch(email)) {
      return "please_enter_valid_email".tr();
    }
    return null;
  }

  String? validateNameText(name) {
    if (name == null || name.isEmpty) {
      return "please_enter_name".tr();
    }
    return null;
  }

  String? validateRePasswordText(rePassword) {
    if (rePassword == null || rePassword.isEmpty) {
      return "must_reenter_password".tr();
    }
    if (rePassword != passwordController.text) {
      return "passwords_do_not_match".tr();
    }
    return null;
  }

  String? validatePasswordText(password) {
    if (password == null || password.isEmpty) {
      return "please_enter_password".tr();
    }
    if (!isPasswordValid.hasMatch(password)) {
      return "• ${"password_must_contain".tr()}\n• ${"one_uppercase_letter".tr()}\n• ${"one_lowercase_letter".tr()}\n• ${"one_number".tr()}\n• ${"one_special_character".tr()}";
    }
    if (password.length < 8) {
      return '• ${"password_must_be_8_characters".tr()}';
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
     notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    if (signInKey.currentState?.validate() ?? false) {
      await authService.signIn(
        context: context,
        email: emailController.text,
        password: passwordController.text,
      );
    }
     notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    await authService.signInWithGoogle(context);
  }

  Future<void> signOut(BuildContext context) async {
    await authService.signOut(context);
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
