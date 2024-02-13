import 'package:get/get.dart';
import '../constants/navigation_constants.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final tabNames = <String>[
    NavigationConstants.SPIRITUAL_EVENTS,
    NavigationConstants.CULTURAL_EVENTS,
    NavigationConstants.LEISURE_EVENTS,
    NavigationConstants.PROMOTERS,
    NavigationConstants.INFO
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    Get.toNamed(tabNames[index]);
  }
}
