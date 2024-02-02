import 'package:flutter/material.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:follow_me/pages/events_list.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';
import '../models/event.dart';
import '../pages/auth_gate.dart';
import '../pages/edit_event_page.dart';
import '../pages/event_page.dart';

class AppRoutes {

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<GetPage> pages = [
    GetPage(
      name: NavigationConstants.EVENTS_LIST,
      page: () => EventsList(Get.arguments['event']),
    ),
    GetPage(
      name: NavigationConstants.SPIRITUAL_EVENTS,
      page: () => const EventsList(AppConstants.SPIRITUAL),
    ),
    GetPage(
      name: NavigationConstants.CULTURAL_EVENTS,
      page: () => const EventsList(AppConstants.CULTURAL),
    ),
    GetPage(
      name: NavigationConstants.LEISURE_EVENTS,
      page: () => const EventsList(AppConstants.LEISURE),
    ),
    GetPage(
      name: NavigationConstants.PROMOTERS,
      page: () => const Center( child: Text(
        'Index 3: Promotori',
        style: optionStyle,
      )),
    ),
    GetPage(
      name: NavigationConstants.INFO,
      page: () => const Center( child: Text(
        'Index 4: Info',
        style: optionStyle,
      )),
    ),
    GetPage(
      name: NavigationConstants.EVENT_PAGE,
      page: () => EventPage(Get.arguments['event']),
    ),
    GetPage(
      name: NavigationConstants.EDIT_EVENT_PAGE,
      page: () => EditEventPage(Get.arguments['event'], Get.arguments['isNew']),
    ),
    GetPage(
      name: NavigationConstants.AUTH_GATE,
      page: () => const AuthGate(),
    )
  ];

  static String getRouteName(Event event){
    switch (event.category) {
      case AppConstants.SPIRITUAL:{
        return NavigationConstants.SPIRITUAL_EVENTS;
      }
      case AppConstants.CULTURAL:{
        return NavigationConstants.CULTURAL_EVENTS;
      }
      case AppConstants.LEISURE:{
        return NavigationConstants.LEISURE_EVENTS;
      }
      default:
        return AppConstants.EMPTY;
    }
  }
}
