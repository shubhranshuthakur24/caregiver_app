import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constants.dart';
import 'my_loved_one_model.dart';

class MyLovedOneServices extends GetxController {
  RxList data = [].obs;
  static int? loved_one_id;
  final picker = ImagePicker();
  bool AnyChangesHaveDone = false;

  uploadImage() async {
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
          var snapshot =
              await _firebaseStorage.ref().child('media/' + TokenServices.userid + "/images/lovedOneProfilePic").putFile(file);
          var downloadUrl = await snapshot.ref.getDownloadURL();
          lovedOneProfileUrlUniversal.value = downloadUrl;
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
        var image;
        image = image = await picker.pickImage(source: ImageSource.gallery);
        var file = File(image!.path);
        if (image != null) {
          showLoading(title: "Image is uploading");
          var snapshot =
              await _firebaseStorage.ref().child('media/' + TokenServices.userid + "/images/lovedOneProfilePic").putFile(file);

          var downloadUrl = await snapshot.ref.getDownloadURL();
          lovedOneProfileUrlUniversal.value = downloadUrl;
          if (Get.isDialogOpen == true) {
            hideLoading();
          }
        } else {
          print('No Image Path Received');
        }
      } catch (error) {
        if (Get.isDialogOpen == true) {
          hideLoading();
        }
      }
    }
  }

  String getDiseaseData() {
    String diseaseName = "";
    for (var data in data[0].diseaseData) {
      diseaseName = diseaseName + data.diseaseName + ", ";
    }
    return diseaseName;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    apiGetLovedProfile();

    super.onInit();
  }

  Future<dynamic> apiGetLovedProfile() async {
    dynamic res;
    print("button pressed");
    var response = await http.get(Uri.parse(ApiFile.getLovedOneProfileUrl + loved_one_id.toString()),
        headers: ({"Authorization": "Token " + TokenServices.token}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        data.clear();
        data.add(MyLovedOneModel.fromJson(decoded["data"][0]));
        // data.clear();
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }

    return res;
  }

  OnBackPressFunctionality() {
    if (AnyChangesHaveDone == false) {
      Get.back();
    } else if (AnyChangesHaveDone == true) {
      UserBioServices.apiGetCgProfile(navigateMethod: "off");
    }
  }
}
