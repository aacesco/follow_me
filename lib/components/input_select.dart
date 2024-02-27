import 'package:flutter/material.dart';
import 'package:follow_me/utils/enum_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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
  SpiritualTypes? selectedSpiritualType;
  CulturalTypes? selectedCulturalType;
  LeisureTypes? selectedLeisureType;

  @override
  Widget build(BuildContext context) {
    widget.controller.text = widget.controller.text.isEmpty
        ? AppConstants.GENERIC
        : widget.controller.text;

    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.label),
          const SizedBox(height: 5),
          buildDropdownButton(widget.category),
        ]));
  }

  buildDropdownButton(String category) {
    final List<String> values = retrieveValues(category);

    return DropdownButton<String>(
      isExpanded: true,
      value: widget.controller.text,
      hint: Text(widget.label),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        setState(() {
          widget.controller.text = value!;
        });
      },
      items: values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
}
