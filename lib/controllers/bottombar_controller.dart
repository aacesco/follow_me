import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';
import '../pages/events_list.dart';

class BottomBarController extends GetxController{
  RxInt selectedIndex = 0.obs;

  final TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _screenList = [
    const EventsList(AppConstants.SPIRITUAL),
    const EventsList(AppConstants.CULTURAL),
    const EventsList(AppConstants.LEISURE),
    const Text(
      'Index 3: Promotori',
      //style: optionStyle,
    ),
    const Text(
      'Index 4: Info',
      //style: optionStyle,
    )
  ];

  changeTabIndex(int index) => selectedIndex.value = index;

  getScreen() {
    var tab = _screenList[selectedIndex.value];
    return tab;
  }
}