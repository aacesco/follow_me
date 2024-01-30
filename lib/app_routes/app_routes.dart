import 'package:follow_me/constants/app_constants.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:follow_me/global_bindings.dart';
import 'package:follow_me/pages/events_list.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../pages/auth_gate.dart';
import '../pages/edit_event_page.dart';
import '../pages/event_page.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: NavigationConstants.HOME_PAGE,
      page: () => const FollowMeHomePage(),
      binding: GlobalBindings(),//todo quando specificare i bindings?
    ),

    GetPage(
      name: NavigationConstants.SPIRITUAL_EVENTS,
      page: () => EventsList(Get.arguments?? AppConstants.EMPTY),
      binding: GlobalBindings(),
    ),
    GetPage(
        name: NavigationConstants.EVENT_PAGE,
        page: () => EventPage(Get.arguments),
        binding: GlobalBindings()
    ),
    GetPage(
        name: NavigationConstants.EDIT_EVENT_PAGE,
        page: () => EditEventPage(Get.arguments['event'], Get.arguments['isNew']),
        binding: GlobalBindings()
    ),
    GetPage(
        name: NavigationConstants.AUTH_GATE,
        page: () => const AuthGate(),
        binding: GlobalBindings()
    )
  ];
}
