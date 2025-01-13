import 'package:easy_localization/easy_localization.dart';
import 'package:event_planning_pojo/ui/firebase_utils/firebase_utils.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';
import 'package:event_planning_pojo/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CreateOrUpdateEventProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  List<EventModel> events = [];

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
      time: selectedTime.toString(),
    );

    FirebaseUtils.addEvent(eventModel).timeout(Duration(milliseconds: 500),
        onTimeout: () {
      Navigator.pop(
        context,
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("event_added_successfully".tr()),
            duration: Duration(seconds: 3),
          ),
        ),
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
      time: selectedTime.toString(),
    );

    FirebaseUtils.updateEvent(eventModel).timeout(Duration(milliseconds: 500),
        onTimeout: () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.tag,
        (route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("event_updated_successfully".tr()),
          duration: Duration(seconds: 3),
        ),
      );
    });
  }

  void deleteEvent(String id, BuildContext context) {
    FirebaseUtils.deleteEvent(id).timeout(Duration(milliseconds: 500),
        onTimeout: () {
      Navigator.pop(
        context,
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("event_deleted_successfully".tr()),
            duration: Duration(seconds: 3),
          ),
        ),
      );
    });
  }

  // Future<void> getEvents() async {
  //   try {
  //     FirebaseUtils.getEvent().listen((QuerySnapshot<EventModel> snapshot) {
  //       events = snapshot.docs.map((doc) => doc.data()).toList();
  //       notifyListeners();
  //     });
  //   } catch (e) {
  //     // Handle error
  //     print("Error fetching events: $e");
  //   }
  // }

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
