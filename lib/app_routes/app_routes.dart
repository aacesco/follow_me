import 'package:follow_me/global_bindings.dart';
import 'package:follow_me/pages/spiritual_events_list.dart';
import 'package:get/get.dart';
import '../pages/edit_event_page.dart';
import '../pages/event_page.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: '/spiritual_events',
      page: () => const SpiritualEventsList(),
      binding: GlobalBindings(),
    ),
    GetPage(
        name: '/event_page',
        page: () => EventPage(Get.arguments),
        binding: GlobalBindings()
    ),
    GetPage(
        name: '/edit_event_page',
        page: () => EditEventPage(Get.arguments['event'], Get.arguments['isNew']),
        binding: GlobalBindings()
    ),
  ];
}
