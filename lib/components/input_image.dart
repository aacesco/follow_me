import 'package:flutter/material.dart';
import 'package:follow_me/controllers/image_picker_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatelessWidget {
  final ImagePicker picker;
  final String label;
  const InputImage(this.picker, this.label, {super.key});

  @override
  Widget build(BuildContext context) {

    ImagePickerController imagePickerCtrl = Get.find();
    imagePickerCtrl.pickImageFromGallery();

    return Padding(padding: const EdgeInsets.all(10),
          child: Center(
            child: Image.network(imagePickerCtrl.imagePath.value),
          ),
    );
  }
}