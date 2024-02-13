import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagePickerController extends GetxController {
  RxString imageUrl = ''.obs;

  Future pickImageFromGallery() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (pickedImage == null) {
      return;
    }

    uploadImageToFirebase(pickedImage.path);
  }

  Future uploadImageToFirebase(String filePath) async {
    Reference storageReference = FirebaseStorage.instance.ref().child('images');
    UploadTask uploadTask = storageReference.putFile(File(filePath));

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    imageUrl.value = downloadUrl;
  }
}
