import 'package:follow_me/controllers/bottombar_controller.dart';
import 'package:get/get.dart';
import 'data/events_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    //todo l'ordine conta?
    Get.put(BottomBarController());
    Get.put(EventsController());
  }
}