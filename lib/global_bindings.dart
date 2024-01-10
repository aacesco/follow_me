import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'data/events_db.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EventsRepo());
  }
}