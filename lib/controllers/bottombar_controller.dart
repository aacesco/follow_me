import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';
import '../constants/navigation_constants.dart';
import '../global_bindings.dart';
import '../main.dart';
import '../pages/auth_gate.dart';
import '../pages/edit_event_page.dart';
import '../pages/event_page.dart';
import '../pages/events_list.dart';

class BottomBarController extends GetxController {
  //todo che metodo usare per richiamare i controller; che differenze ci sono?
  //static BottomBarController get to => Get.find();
  //Get.find<BottomBarController>()
  //Get.put(BottomBarController());
  RxInt selectedIndex = 0.obs;

  final TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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

  final pages = <String>[
    NavigationConstants.SPIRITUAL_EVENTS,
    NavigationConstants.CULTURAL_EVENTS,
    NavigationConstants.LEISURE_EVENTS,
    NavigationConstants.PROMOTERS,
    NavigationConstants.INFO
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    //todo credo lanci questo errore Multiple widgets used the same GlobalKey.
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    //todo come gestire eventuali arguments null?
    Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case NavigationConstants.HOME_PAGE:{
        return GetPageRoute(
            settings: settings,
            page: () => const FollowMeHomePage(),
            binding: GlobalBindings());
      }
      case NavigationConstants.SPIRITUAL_EVENTS:{
        return GetPageRoute(
            settings: settings,
            page: () => const EventsList(AppConstants.SPIRITUAL),
            binding: GlobalBindings());
      }
      case NavigationConstants.CULTURAL_EVENTS:{
        return GetPageRoute(
            settings: settings,
            page: () => const EventsList(AppConstants.CULTURAL),
            binding: GlobalBindings());
      }
      case NavigationConstants.LEISURE_EVENTS:{
        return GetPageRoute(
            settings: settings,
            page: () => const EventsList(AppConstants.LEISURE),
            binding: GlobalBindings());
      }
      case NavigationConstants.EVENT_PAGE:{
        return GetPageRoute(
            settings: settings,
            page: () => EventPage(arguments?['event']),
            binding: GlobalBindings());
      }
      case NavigationConstants.EDIT_EVENT_PAGE:{
        return GetPageRoute(
            settings: settings,
            page: () =>
                EditEventPage(arguments?['event'], arguments?['isNew']),
            binding: GlobalBindings());
      }
      case NavigationConstants.AUTH_GATE:{
        return GetPageRoute(
            settings: settings,
            page: () => const AuthGate(),
            binding: GlobalBindings());
      }
      case NavigationConstants.PROMOTERS:{
        return GetPageRoute(
            settings: settings,
            page: () => Center( child: Text(
              'Index 3: Promotori',
              style: optionStyle,
            )),
            binding: GlobalBindings());
      }
      case NavigationConstants.INFO:
        {
          return GetPageRoute(
              settings: settings,
              page: () => Center( child: Text(
                'Index 4: Info',
                style: optionStyle,
              )),
              binding: GlobalBindings());
        }
      default:
        return null;
    }
  }
}
