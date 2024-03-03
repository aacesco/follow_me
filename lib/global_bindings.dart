import 'package:follow_me/controllers/dates_controller.dart';
import 'package:get/get.dart';
import 'controllers/bottombar_controller.dart';
import 'controllers/scroll_position_controller.dart';
import 'controllers/events_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    //todo l'ordine conta?
    Get.put(BottomBarController());
    Get.put(EventsController());
    Get.put(ScrollPositionController());
    Get.put(DatesController());
  }
}
