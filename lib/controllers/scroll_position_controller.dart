import 'package:get/get.dart';
import '../constants/app_constants.dart';

class ScrollPositionController extends GetxController {
  RxDouble spiritualEventsScrollPosition = 0.0.obs;
  RxDouble culturalEventsScrollPosition = 0.0.obs;
  RxDouble leisureEventsScrollPosition = 0.0.obs;
  RxDouble eventScrollPosition = 0.0.obs;

  void saveScrollPosition(double position, String category) {
    switch (category) {
      case AppConstants.SPIRITUAL:
        {
          //  print("spiritual: " + position.toString());
          spiritualEventsScrollPosition.value = position;
          break;
        }
      case AppConstants.CULTURAL:
        {
          // print("cultural: " + position.toString());
          culturalEventsScrollPosition.value = position;
          break;
        }
      case AppConstants.LEISURE:
        {
          // print("leisure: " + position.toString());
          leisureEventsScrollPosition.value = position;
          break;
        }
      default:
      //do nothing
    }
  }

  double getScrollPosition(String category) {
    switch (category) {
      case AppConstants.SPIRITUAL:
        {
          return spiritualEventsScrollPosition.value;
        }
      case AppConstants.CULTURAL:
        {
          return culturalEventsScrollPosition.value;
        }
      case AppConstants.LEISURE:
        {
          return leisureEventsScrollPosition.value;
        }
      default:
        return 0.0;
    }
  }
}
