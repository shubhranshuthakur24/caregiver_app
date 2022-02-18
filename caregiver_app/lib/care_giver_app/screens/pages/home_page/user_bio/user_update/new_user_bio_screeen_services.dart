import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/SRC/string_manipulation_function/string_manipulation.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/assessment_widgets.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/profile_image_upload_fetch_from_firebase/profile_image_upload_firebase.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';
import '../user_bio_services.dart';

class NewUserBioScreenUpdateServices extends GetxController {
  bool HasAnythingChanged = false;
  UserBioServices _userBioServices = Get.find();
  ProfileImageUploadFirebase _profileImageUploadFirebase = Get.put(ProfileImageUploadFirebase());
  late String cg_zipcode;
  late String cg_gender;
  late String cg_ethnicity;
  late String dob;
  late String cg_firstName;
  late String cg_lastName;
  late String cg_email;
  late TextEditingController cg_zipcodeEditingController;
  late TextEditingController cgFullNameEditingController;
  late TextEditingController cgEmailEditingController;
  late TextEditingController cgDobEditingController;
  late TextEditingController cgMantraController;
  final picker = ImagePicker();
  var image;
  var file;

  @override
  void onInit() {
    // TODO: implement onInit
    cg_gender = _userBioServices.data["data"]["cg_gender"] ?? "";
    cg_ethnicity = _userBioServices.data["data"]["cg_ethnicity"] ?? "";
    List dobList = _userBioServices.data["data"]["cg_dob"].split("-");
    dob = dobList[dobList.length - 1] ?? "";
    cg_firstName = _userBioServices.data["data"]["cg_first_name"] ?? "";
    cg_lastName = _userBioServices.data["data"]["cg_last_name"] ?? "";
    cg_email = _userBioServices.data["data"]["email"] ?? "";
    cg_zipcode = _userBioServices.data["data"]["zipcode"] ?? "";
    cg_zipcodeEditingController = TextEditingController(text: cg_zipcode);
    cgFullNameEditingController = TextEditingController(text: cg_firstName + " " + cg_lastName);
    cgEmailEditingController = TextEditingController(text: cg_email);
    cgDobEditingController = TextEditingController(text: dob);
    cgMantraController = TextEditingController(text: _userBioServices.data["data"]["mymantra"] ?? "");
    super.onInit();
  }

  void cgProfileUpdate() {
    String user_genderid = genderList.indexOf(cg_gender).toString();
    String ethnicityid = ethnicityList.indexOf(cg_ethnicity).toString();

    showLoading(title: "Saving");
    if (image == null) {
      apiUpdateUserDeatils(
          zipcode: cg_zipcodeEditingController.text,
          user_genderid: user_genderid,
          ethnicityid: ethnicityid,
          dob: cgDobEditingController.text);
    } else {
      _profileImageUploadFirebase.uploadImage(picName: "cgProfilePic", file: file).then((value) {
        apiUpdateUserDeatilsWithImage(
            zipcode: cg_zipcodeEditingController.text,
            user_genderid: user_genderid,
            ethnicityid: ethnicityid,
            dob: cgDobEditingController.text);
      });
    }
  }

  Future<String> apiUpdateUserDeatils(
      {required String zipcode, required String user_genderid, required String ethnicityid, required String dob}) async {
    List<String> splitNameList = StringManipulation.nameSplit(fullname: cgFullNameEditingController.text.trim());
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.userDeatilsApiUrl),
        body: ({
          "zipcode": zipcode,
          "user_genderid": user_genderid,
          "ethnicityid": ethnicityid,
          "dob": dob,
          "firstname": splitNameList[0],
          "lastname": splitNameList[1],
          "profile_picurl": userProfileUrlUniversal.value,
          "mymantra": cgMantraController.text
        }),
        headers: ({'Authorization': "Token " + TokenServices.token}));

    var decoded = jsonDecode(response.body);
    if (Get.isDialogOpen == true) {
      hideLoading();
    }
    showToast(decoded["status"]);
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        HasAnythingChanged = true;
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');

      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }

  Future<String> apiUpdateUserDeatilsWithImage(
      {required String zipcode, required String user_genderid, required String ethnicityid, required String dob}) async {
    String res = "";
    List<String> splitNameList = StringManipulation.nameSplit(fullname: cgFullNameEditingController.text.trim());
    var response = await http.post(Uri.parse(ApiFile.userDeatilsApiUrl),
        body: ({
          "zipcode": zipcode,
          "user_genderid": user_genderid,
          "ethnicityid": ethnicityid,
          "dob": dob,
          "profile_picurl": userProfileUrlUniversal.value,
          "firstname": splitNameList[0],
          "lastname": splitNameList[1],
          "mymantra": cgMantraController.text
        }),
        headers: ({'Authorization': "Token " + TokenServices.token}));

    var decoded = jsonDecode(response.body);
    if (Get.isDialogOpen == true) {
      hideLoading();
    }
    showToast(decoded["status"]);
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        HasAnythingChanged = true;
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');

      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }
}
