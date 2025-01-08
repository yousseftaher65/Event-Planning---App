import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateOrUpdateEventProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? selectedDate ;
  TimeOfDay? selectedTime ;

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

  void chooseDate(BuildContext context) async {
    var selectDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (selectDate != null) {
      selectedDate = selectDate;
     } else {
      selectedDate = null;
    }
    notifyListeners();
  }

  void chooseTime(BuildContext context) async {
    var selectTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectTime != null) {
      selectedTime = selectTime;
      } else {
      selectedTime = null;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
