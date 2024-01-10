import 'package:get/get.dart';

import 'data/events_db.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EventsRepo());
  }
}