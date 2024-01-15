import 'package:follow_me/global_bindings.dart';
import 'package:follow_me/pages/spiritual_events_list.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: '/spiritual_events',
      page: () => SpiritualEventsList(),
      binding: GlobalBindings(),

    ),
    // Add more pages as needed
  ];
}
