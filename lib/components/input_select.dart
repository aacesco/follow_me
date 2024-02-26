import 'package:flutter/material.dart';
import 'package:follow_me/utils/enum_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: buildDropdownMenu(widget.category, widget.label),
    );
  }

  buildDropdownMenu(String category, String label) {
    Categories categoryEnum =
        EnumHelper.fromName(Categories.values, category, Categories.spiritual);

    switch (categoryEnum) {
      case Categories.spiritual:
        return DropdownMenu<SpiritualTypes>(
          controller: widget.controller,
          enableSearch: false,
          label: Text(label),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          onSelected: (SpiritualTypes? type) {
            setState(() {
              selectedSpiritualType = type;
            });
          },
          dropdownMenuEntries: buildEntries(),
        );
      case Categories.cultural:
        return DropdownMenu<CulturalTypes>(
          controller: widget.controller,
          enableSearch: false,
          label: Text(label),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          onSelected: (CulturalTypes? type) {
            setState(() {
              selectedCulturalType = type;
            });
          },
          dropdownMenuEntries:
              CulturalTypes.values.map<DropdownMenuEntry<CulturalTypes>>(
            (CulturalTypes type) {
              String dynamicValue = type.name;
              return DropdownMenuEntry<CulturalTypes>(
                  value: type,
                  label: Intl.message(
                    dynamicValue,
                    name: 'getDynamicString',
                    args: [dynamicValue],
                  ) //type.name//AppLocalizations.of(context)!.category
                  );
            },
          ).toList(),
        );
      case Categories.leisure:
        return DropdownMenu<LeisureTypes>(
          controller: widget.controller,
          enableSearch: false,
          label: Text(label),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          onSelected: (LeisureTypes? type) {
            setState(() {
              selectedLeisureType = type;
            });
          },
          dropdownMenuEntries:
              LeisureTypes.values.map<DropdownMenuEntry<LeisureTypes>>(
            (LeisureTypes type) {
              String dynamicValue = type.name;
              return DropdownMenuEntry<LeisureTypes>(
                  value: type,
                  label: Intl.message(
                    dynamicValue,
                    name: 'getDynamicString',
                    args: [dynamicValue],
                  ) //type.name//AppLocalizations.of(context)!.category
                  );
            },
          ).toList(),
        );
    }
  }

  buildEntries() {
    List<DropdownMenuEntry<SpiritualTypes>> list =
        SpiritualTypes.values.map<DropdownMenuEntry<SpiritualTypes>>(
      (SpiritualTypes type) {
        String dynamicValue = type.name;
        return DropdownMenuEntry<SpiritualTypes>(
            value: type,
            label: Intl.message(
              dynamicValue,
              name: 'getDynamicString',
              args: [dynamicValue],
            ) //type.name//AppLocalizations.of(context)!.category
            );
      },
    ).toList();

    return list;
  }
}
