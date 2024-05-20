import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_form/controllers/formprovider.dart';

class DOB_field extends StatelessWidget {
  const DOB_field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: provider.dayController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              hintText: 'DD',
            ),
            maxLength: 2,
            onChanged: (value) {
              if (value.length == 2) {
                FocusScope.of(context).nextFocus();
              }
              provider.setDay(value);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: provider.monthController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              hintText: 'MM',
            ),
            maxLength: 2,
            onChanged: (value) {
              if (value.length == 2) {
                FocusScope.of(context).nextFocus();
              }
              provider.setMonth(value);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: provider.yearController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
              hintText: 'YYYY',
            ),
            maxLength: 4,
            onChanged: (value) {
              provider.setYear(value);
            },
          ),
        ),
      ],
    );
  }
}
