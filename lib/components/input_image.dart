import 'package:flutter/material.dart';
import 'package:follow_me/controllers/image_picker_controller.dart';
import 'package:get/get.dart';

import 'cover_image.dart';

class InputImage extends StatelessWidget {
  final ImagePickerController imageCtrl;
  final String label;
  const InputImage(this.imageCtrl, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            Stack(
              children: [
                Obx(() {
                  final imageUrl = imageCtrl.imageUrl.value;
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CoverImage(
                        imageUrl.isNotEmpty ? imageCtrl.imageUrl.value : ''),
                  );
                }),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    heroTag: "inputImage",
                    onPressed: () {
                      imageCtrl.pickImageFromGallery();
                    },
                    child: const Icon(Icons.cloud_upload),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
