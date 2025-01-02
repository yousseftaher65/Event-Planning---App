import 'package:flutter/material.dart';

class ShowPasswordProvider extends ChangeNotifier {

  bool _isScure = true;
  bool get isScure => _isScure;
  void toggleShowPassword() {
    _isScure = !_isScure;
    notifyListeners();
  }
}