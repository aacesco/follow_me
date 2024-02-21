import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/constants/app_enums.dart';

class AppConstants {
  static const String EMPTY = "";
  static const String GENERIC = "generic";

  static const String EVENTS = "events";
  static const String SPIRITUAL = "spiritual";
  static const String CULTURAL = "cultural";
  static const String LEISURE = "leisure";

  static List<ButtonSegment<Categories>> categoryList(BuildContext context) {
    return [
      ButtonSegment<Categories>(
          value: Categories.spiritual,
          label: Text(AppLocalizations.of(context)!.spiritualEvents)),
      ButtonSegment<Categories>(
          value: Categories.cultural,
          label: Text(AppLocalizations.of(context)!.culturalEvents)),
      ButtonSegment<Categories>(
          value: Categories.leisure,
          label: Text(AppLocalizations.of(context)!.leisureEvents))
    ];
  }
}
