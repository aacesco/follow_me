import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final String label;
  final DateTime? defaultValue;

  InputDateTimeField(this.label, {super.key, this.defaultValue});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label),
          Container(
            color: Colors.grey[200],
            child: DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) async {
                currentValue = defaultValue;
                return await showDatePicker(
                  context: context,
                  firstDate: DateTime(2024),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((DateTime? date) async {
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                });
              },
              resetIcon: const Icon(Icons.cancel),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: label,
                icon: const Icon(Icons.calendar_month),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent)),
              ),
            ),
          ),
        ]);
  }
}
