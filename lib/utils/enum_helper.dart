import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../holders/value_label_holder.dart';

class EnumHelper {
  static T fromName<T>(List<T> values, String name, T defaultValue) {
    return values.firstWhere(
      (e) => e.toString().split('.').last == name,
      orElse: () => defaultValue,
    );
  }

  static List<String> getList<T>(List<T> values) {
    return values.map((e) => e.toString().split('.').last).toList();
  }

  static List<ValueLabelHolder> getEntries<T>(
      List<T> values, BuildContext context) {
    List<ValueLabelHolder> list = <ValueLabelHolder>[];
    for (T e in values) {
      String value = e.toString().split('.').last;
      String label = getLocalizedValue(context, value);
      ValueLabelHolder item = ValueLabelHolder(value, label);
      list.addIf((list.where((element) => element.value == value).isEmpty), item);
    }

    return list;
  }

  static getLocalizedValue(BuildContext context, String value) {
    switch (value) {
      case "spiritual":
        return AppLocalizations.of(context)!.spiritual;
      case "cultural":
        return AppLocalizations.of(context)!.cultural;
      case "leisure":
        return AppLocalizations.of(context)!.leisure;
      case "pilgrimage":
        return AppLocalizations.of(context)!.pilgrimage;
      case "discernment":
        return AppLocalizations.of(context)!.discernment;
      case "fiances":
        return AppLocalizations.of(context)!.fiances;
      case "affectivity":
        return AppLocalizations.of(context)!.affectivity;
      case "family":
        return AppLocalizations.of(context)!.family;
      case "exercises":
        return AppLocalizations.of(context)!.exercises;
      case "mission":
        return AppLocalizations.of(context)!.mission;
      case "catechesis":
        return AppLocalizations.of(context)!.catechesis;
      case "religiousVocation":
        return AppLocalizations.of(context)!.religiousVocation;
      case "femininity":
        return AppLocalizations.of(context)!.femininity;
      case "easter":
        return AppLocalizations.of(context)!.easter;
      case "commonLife":
        return AppLocalizations.of(context)!.commonLife;
      case "retreat":
        return AppLocalizations.of(context)!.retreat;
      case "exhibitions":
        return AppLocalizations.of(context)!.exhibitions;
      case "theater":
        return AppLocalizations.of(context)!.theater;
      case "cinema":
        return AppLocalizations.of(context)!.cinema;
      case "literature":
        return AppLocalizations.of(context)!.literature;
      case "conferences":
        return AppLocalizations.of(context)!.conferences;
      case "festival":
        return AppLocalizations.of(context)!.festival;
      case "concerts":
        return AppLocalizations.of(context)!.concerts;
      case "socioPolitical":
        return AppLocalizations.of(context)!.socioPolitical;
      case "generic":
        return AppLocalizations.of(context)!.generic;
      case "excursion":
        return AppLocalizations.of(context)!.excursion;
      case "kitchen":
        return AppLocalizations.of(context)!.kitchen;
      case "sport":
        return AppLocalizations.of(context)!.sport;
      case "picnic":
        return AppLocalizations.of(context)!.picnic;
      case "games":
        return AppLocalizations.of(context)!.games;
      default:
        return value;
    }
  }
}
