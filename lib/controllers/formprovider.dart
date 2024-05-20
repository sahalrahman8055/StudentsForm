import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  List<String> selectedsubjectList = [];
  var selectedSubject = '';

  List<String> subject = ['Python', 'Flutter', 'Mern', 'React'];

  // Add the university list
  List<String> universityList = [
    'Calicut Univercity',
    'igno Univercity ',
    'ooty Univercity',
  ];

  String? selectedUniversity;
  String? dateofBirth;
  String? day;
  String? month;
  String? year;

  void setSelectedUniversity(String? university) {
    selectedUniversity = university;
    notifyListeners();
  }

  void setDay(String? value) {
    day = value;
    notifyListeners();
  }

  void setMonth(String? value) {
    month = value;
    notifyListeners();
  }

  void setYear(String? value) {
    year = value;
    notifyListeners();
  }

  void asignDateOfBirth() {
    if (day != null && month != null && year != null) {
      dateofBirth = '$day/$month/$year';
    }
  }
}
