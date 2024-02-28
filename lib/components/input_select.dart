import 'dart:core';

import 'package:flutter/material.dart';
import 'package:follow_me/utils/enum_helper.dart';

import '../constants/app_constants.dart';
import '../constants/app_enums.dart';
import '../holders/value_label_holder.dart';

class InputSelect extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String category;
  final bool? mandatory;
  const InputSelect(this.controller, this.label, this.category,
      {super.key, this.mandatory});

  @override
  State<InputSelect> createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  late ValueLabelHolder selectedValue;

  @override
  Widget build(BuildContext context) {
    List<ValueLabelHolder> values = retrieveValues(widget.category);
    String currentValue = setCurrentValue(values);

    selectedValue = values.firstWhere((e) => e.value == currentValue);
    widget.controller.text = currentValue;

    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.label),
          const SizedBox(height: 5),
          buildDropdownButton(widget.category, values),
        ]));
  }

  buildDropdownButton(String category, List<ValueLabelHolder> values) {
    return DropdownButton<ValueLabelHolder>(
      isExpanded: true,
      value: selectedValue,
      hint: Text(widget.label),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (ValueLabelHolder? newValue) {
        setState(() {
          selectedValue = newValue!;
          widget.controller.text = newValue.value;
        });
      },
      items: values
          .map<DropdownMenuItem<ValueLabelHolder>>((ValueLabelHolder entry) {
        return DropdownMenuItem<ValueLabelHolder>(
          value: entry,
          child: Text(entry.label),
        );
      }).toList(),
    );
  }

  List<ValueLabelHolder> retrieveValues(String category) {
    switch (category) {
      case "spiritual":
        return EnumHelper.getEntries(SpiritualTypes.values, context);
      case "cultural":
        return EnumHelper.getEntries(CulturalTypes.values, context);
      case "leisure":
        return EnumHelper.getEntries(LeisureTypes.values, context);
      default:
        return <ValueLabelHolder>[];
    }
  }

  String setCurrentValue(List<ValueLabelHolder> values) {
    String currentValue = widget.controller.text;

    if (currentValue.isEmpty ||
        values.where((element) => element.value == currentValue).isEmpty) {
      return AppConstants.GENERIC;
    }

    return currentValue;
  }
}
