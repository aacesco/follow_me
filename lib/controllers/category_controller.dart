import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString selectedCategory = ''.obs;
  RxInt index = 0.obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  void changedCategory(int newIndex) {
    index.value = newIndex;
  }

/*
  import 'package:get/get.dart';

  class CategoryController extends GetxController {
  var selectedCategory = Categories.spiritual.obs;

  void onSelectionChanged(Set<Categories> categories) {
  selectedCategory.value = categories.first;
  }
  }
  Initialize the controller in your widget:
  dart
  Copy code
  final CategoryController categoryController = Get.put(CategoryController());
  Update your widget to use the GetX controller:
  dart
  Copy code
  SegmentedButton(
  segments: AppConstants.categoryList(context),
  selected: <Categories>{
  EnumHelper.fromName(Categories.values, widget.event.category, Categories.spiritual),
  },
  onSelectionChanged: categoryController.onSelectionChanged,
  style: ButtonStyle(
  shape: MaterialStateProperty.all(
  RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0.0),
  ),
  ),
  ),
  )
  Access the selected category using the GetX controller:
  dart
  Copy code
  setState(() {
  widget.event.category = categoryController.selectedCategory.value.name;
  });*/
}
