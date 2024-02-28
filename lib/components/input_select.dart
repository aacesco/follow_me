import 'dart:core';

import 'package:flutter/material.dart';
import 'package:follow_me/utils/enum_helper.dart';

import '../constants/app_constants.dart';
import '../constants/app_enums.dart';

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
  late MapEntry<String, dynamic> selectedValue;
  late final Map<String, dynamic> values1;

  @override
  Widget build(BuildContext context) {
    String key = widget.controller.text.isEmpty
        ? AppConstants.GENERIC
        : widget.controller.text;
    String label = EnumHelper.getLocalizedValue(context, key);
    values1 = retrieveValues1(widget.category);
    selectedValue = values1.entries.firstWhere((e) => e.key == key);
    widget.controller.text = key;

    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.label),
          const SizedBox(height: 5),
          buildDropdownButton(widget.category),
        ]));
  }

  buildDropdownButton(String category) {
    //final List<String> values = retrieveValues(category);
    int count = values1.entries.where((item) {
      return item.key == selectedValue.key;
    }).length;
    bool presente = count == 1;
    print("selectedValue: $selectedValue");
    print("values1: $values1");
    print("presente: $presente");

    return DropdownButton<MapEntry<String, dynamic>>(
      isExpanded: true,
      value: selectedValue,
      hint: Text(widget.label),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (MapEntry<String, dynamic>? newValue) {
        setState(() {
          print("selectedValue: $newValue");
          selectedValue = newValue!;
          widget.controller.text = newValue.key;
        });
      },
      items: values1.entries.map<DropdownMenuItem<MapEntry<String, dynamic>>>(
          (MapEntry<String, dynamic> entry) {
        return DropdownMenuItem<MapEntry<String, dynamic>>(
          value: entry,
          child: Text(entry.value),
        );
      }).toList(),
    );
  }

  List<String> retrieveValues(String category) {
    switch (category) {
      case "spiritual":
        return EnumHelper.getList(SpiritualTypes.values);
      case "cultural":
        return EnumHelper.getList(CulturalTypes.values);
      case "leisure":
        return EnumHelper.getList(LeisureTypes.values);
      default:
        return [];
    }
  }

  Map<String, dynamic> retrieveValues1(String category) {
    switch (category) {
      case "spiritual":
        return EnumHelper.getEntries(SpiritualTypes.values, context);
      case "cultural":
        return EnumHelper.getEntries(CulturalTypes.values, context);
      case "leisure":
        return EnumHelper.getEntries(LeisureTypes.values, context);
      default:
        return <String, dynamic>{};
    }
  }
}
