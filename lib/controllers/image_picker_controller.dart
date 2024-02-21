import 'package:get/get.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagePickerController extends GetxController {
  RxString imageUrl = ''.obs;

  Future pickImageFromGallery() async {
    final XFile? pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 30);
    if (pickedImage == null) {
      return;
    }

    uploadImageToFirebase(pickedImage);
  }

  Future uploadImageToFirebase(XFile imageFile) async {
    Reference storageReference = FirebaseStorage.instance.ref().child(
        'images/${DateTime.now().toString()}${extension(imageFile.path)}');

    UploadTask uploadTask = storageReference.putFile(File(imageFile.path));

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    imageUrl.value = downloadUrl;
  }
}
