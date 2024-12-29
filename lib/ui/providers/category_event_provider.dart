import 'package:flutter/material.dart';

class CategoryEventProvider extends ChangeNotifier {
  List<String> categoryList =
  [
    "book_club",
    "eating",
    "birthday",
    "exhibition",
    "gaming",
    "sport",
    "holiday",
    "meeting",
    "workshop",
  ];

  int currentCategoryIndex = 0;

  changeCategory(int index) {
    currentCategoryIndex = index;
    notifyListeners();
  }
}
