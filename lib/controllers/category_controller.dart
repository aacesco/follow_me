import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/app_constants.dart';

class CategoryController extends GetxController {
  RxString selectedCategory = AppConstants.SPIRITUAL.obs;
  RxInt index = 0.obs;

  static Map<String, Widget> categories(BuildContext context) {
    return {
      AppConstants.SPIRITUAL:
          Text(AppLocalizations.of(context)!.spiritualEvents),
      AppConstants.CULTURAL: Text(AppLocalizations.of(context)!.culturalEvents),
      AppConstants.LEISURE: Text(AppLocalizations.of(context)!.leisureEvents)
    };
  }

  void changeCategory(String category) {
    print('current cat: ${selectedCategory.value}, new categoria; $category');
    selectedCategory.value = category;
  }

  void changedCategory(int newIndex) {
    print('current index: ${index.value}, new index; $newIndex');
    index.value = newIndex;
  }
}
