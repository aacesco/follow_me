import 'package:get/get.dart';
import 'data/events_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EventsController());
  }
}