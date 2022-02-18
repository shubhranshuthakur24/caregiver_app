import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../constants.dart';

class ProfileImageUploadFirebase extends GetxController {
  final picker = ImagePicker();

  Future uploadImage({required String picName, required File file}) async {
    if (GetPlatform.isIOS) {
      final _firebaseStorage = FirebaseStorage.instance;
      final _imagePicker = ImagePicker();
      PickedFile? image;
      //Check Permissions
      await Permission.photos.request();

      var permissionStatus = await Permission.photos.status;

      if (permissionStatus.isGranted) {
        //Select Image
        image = (await _imagePicker.pickImage(source: ImageSource.gallery)) as PickedFile?;
        var file = File(image!.path);

        if (image != null) {
          //Upload to firebase
          var snapshot = await _firebaseStorage.ref().child('media/' + TokenServices.userid + "/images/" + picName).putFile(file);
          var downloadUrl = await snapshot.ref.getDownloadURL();
          if (picName == "cgProfilePic") {
            userProfileUrlUniversal.value = downloadUrl;
          } else if (picName == "loProfilePic") {
            lovedOneProfileUrlUniversal.value = downloadUrl;
          }
        } else {
          print('No Image Path Received');
        }
      } else {
        print('Permission not granted. Try Again with permission access');
      }
    }
    if (GetPlatform.isAndroid) {
      try {
        final _firebaseStorage = FirebaseStorage.instance;
        // var image;
        // image = image = await picker.pickImage(source: ImageSource.gallery);
        // var file = File(image!.path);
        if (true) {
          var snapshot = await _firebaseStorage.ref().child('media/' + TokenServices.userid + "/images/" + picName).putFile(file);

          var downloadUrl = await snapshot.ref.getDownloadURL();
          if (picName == "cgProfilePic") {
            userProfileUrlUniversal.value = downloadUrl;
          } else if (picName == "loProfilePic") {
            lovedOneProfileUrlUniversal.value = downloadUrl;
          }
        } else {
          print('No Image Path Received');
        }
      } catch (error) {}
    }
  }
}
