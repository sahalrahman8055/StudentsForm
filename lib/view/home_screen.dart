import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';
import 'package:students_form/controllers/formprovider.dart';
import 'package:students_form/view/widgets/dob_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // void dispose() {
  //   dayController.dispose();
  //   monthController.dispose();
  //   yearController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 130),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name..."),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: provider.selectedUniversity,
                  items: provider.universityList
                      .map((university) => DropdownMenuItem<String>(
                            value: university,
                            child: Text(university),
                          ))
                      .toList(),
                  hint: const Text('Select University'),
                  onChanged: (String? newUniversity) {
                    provider.setSelectedUniversity(newUniversity);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                DropDownMultiSelect(
                  whenEmpty: "select subject",
                  selectedValuesStyle:
                      const TextStyle(color: Colors.transparent),
                  options: provider.subject,
                  selectedValues: provider.selectedsubjectList,
                  onChanged: (value) {
                    provider.selectedsubjectList = value;
                  },
                ),
                const SizedBox(height: 20),
                DOB_field(),
                const SizedBox(height: 40),
                CupertinoButton(
                  child: Text("Submit"),
                  onPressed: () {},
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
