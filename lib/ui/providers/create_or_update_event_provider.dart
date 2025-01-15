import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/firebase_utils/firebase_utils.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateOrUpdateEventProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<String> categoryList = [
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

  final List<String> eventslist = [
    "all",
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

  initCategory(String image) {
    currentCategoryIndex = categoryList.indexOf(image);
  }

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

  void addEvent(String image, String name, BuildContext context) {
    EventModel eventModel = EventModel(
      image: image,
      name: name,
      title: titleController.text,
      description: descriptionController.text,
      date: selectedDate!,
      time: selectedTime!,
    );

    FirebaseUtils.addEvent(eventModel).then((_) {
      Navigator.pop(
        context,
        Fluttertoast.showToast(
            msg: "event_added_successfully".tr(),
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0),
      );
    });
  }

  void updateEvent(String id, String image, String name, BuildContext context) {
    EventModel eventModel = EventModel(
      id: id,
      image: image,
      name: name,
      title: titleController.text,
      description: descriptionController.text,
      date: selectedDate!,
      time: selectedTime!,
    );

    FirebaseUtils.updateEvent(eventModel).then((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.tag,
        (route) => false,
      );
      Fluttertoast.showToast(
          msg: "event_updated_successfully".tr(),
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void deleteEvent(String id, BuildContext context) {
    FirebaseUtils.deleteEvent(id).then((_) {
      Navigator.pop(
          context,
          Fluttertoast.showToast(
              msg: "event_deleted_successfully".tr(),
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: 16.0));
    });
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
