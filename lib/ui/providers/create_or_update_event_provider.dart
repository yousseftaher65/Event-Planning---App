import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateOrUpdateEventProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //final updateEventKey = GlobalKey<FormState>();

  String? titleValidation(String? tilte) {
    if (tilte == null || tilte.isEmpty) {
      return "this_field_is_required".tr();
    }
    return null;
  }

  String? descreptionValidation(String? description) {
    if (description == null || description.isEmpty) {
      return "this_field_is_required".tr();
    }
    return null;
  }

  void validate() {
    if (formKey.currentState?.validate() ?? false) {
      titleController.text;
      descriptionController.text;
    }
  }
}
