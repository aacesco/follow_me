import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString selectedCategory = ''.obs;
  RxInt index = 0.obs;

  void changeCategory(String category) {
    print('current cat: ${selectedCategory.value}, new categoria; $category');
    selectedCategory.value = category;
  }

  void changedCategory(int newIndex) {
    print('current index: ${index.value}, new index; $newIndex');
    index.value = newIndex;
  }
}
