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
import '../my_loved_one_sevices.dart';

class MyLovedOneUpdateScreenServices extends GetxController {
  late TextEditingController nameTextEditingController;
  late TextEditingController zipCodeTextEditingController;
  late TextEditingController dobTextEditingController;
  MyLovedOneServices _myLovedOneServices = Get.find();
  List diseaseDataList = [];

  final picker = ImagePicker();
  var image;
  var file;

  @override
  void onInit() {
    textEditingControllerInitialize();
    extractAndStoreDiseaseId();
    super.onInit();
  }

  void textEditingControllerInitialize() {
    nameTextEditingController =
        TextEditingController(text: _myLovedOneServices.data[0].firstName + " " + _myLovedOneServices.data[0].lastName);
    zipCodeTextEditingController = TextEditingController(text: _myLovedOneServices.data[0].zipcode);
    dobTextEditingController = TextEditingController(text: _myLovedOneServices.data[0].dob.split("-")[2]);
  }

  void extractAndStoreDiseaseId() {
    for (var data in _myLovedOneServices.data[0].diseaseData) {
      diseaseDataList.add(data.diseaseid);
    }
  }

  Future<String> apiUpdateLovedOneDeatils() async {
    print(lovedOneProfileUrlUniversal.value.toString());
    String res = "";
    try {
      String user_genderid = genderList.indexOf(_myLovedOneServices.data[0].gender).toString();
      String ethnicityid = ethnicityList.indexOf(_myLovedOneServices.data[0].ethnicity).toString();
      int relationshipId = _myLovedOneServices.data[0].relationshipid ?? -1;
      List<String> nameList = StringManipulation.nameSplit(fullname: nameTextEditingController.text.trim());
      var response = await http.post(Uri.parse(ApiFile.updateLovedOneDetailsApiUrl),
          body: ({
            "first_name": nameList[0],
            "last_name": nameList[1],
            "zipcode": zipCodeTextEditingController.text,
            "user_genderid": user_genderid,
            "ethnicityid": ethnicityid,
            "dob": dobTextEditingController.text,
            "relationship_id": relationshipId.toString(),
            "disease_id": diseaseDataList.toString(),
            "profile_picurl": lovedOneProfileUrlUniversal.value
          }),
          headers: ({'Authorization': "Token " + TokenServices.token}));

      var decoded = jsonDecode(response.body);
      if (Get.isDialogOpen == true) {
        hideLoading();
      }
      showToast(decoded["status"]);
      if (response.statusCode == 200) {
        if (decoded["status"] == "success") {}
      } else {
        print('Request failed with status: ${response.statusCode}.');
        showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
      }
    } catch (error) {
      if (Get.isDialogOpen == true) {
        hideLoading();
      }
    }
    return res;
  }

  void LovedOneProfileUpdate() {
    showLoading(title: "Saving");
    if (image == null) {
      apiUpdateLovedOneDeatils().then((value) {
        _myLovedOneServices.AnyChangesHaveDone = true;
        _myLovedOneServices.apiGetLovedProfile();
      });
    } else {
      ProfileImageUploadFirebase _profileImageUploadFirebase = Get.put(ProfileImageUploadFirebase());
      _profileImageUploadFirebase.uploadImage(picName: "loProfilePic", file: file).then((value) {
        apiUpdateLovedOneDeatils().then((value) {
          _myLovedOneServices.AnyChangesHaveDone = true;
          _myLovedOneServices.apiGetLovedProfile();
        });
      });
    }
    _myLovedOneServices.apiGetLovedProfile();
  }
}
