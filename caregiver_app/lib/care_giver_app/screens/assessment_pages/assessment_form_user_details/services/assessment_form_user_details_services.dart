import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/assessment_form_user_details/services/button_color_change_when_all_required_feild_are_filled.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../aaessment_form_lovedOnes_details/assessment_form_lovedones_details_screen.dart';

class AssessmentFormUserDetailsServices extends GetxController {
  final zipCodeController = TextEditingController();
  final yearOfBirthController = TextEditingController();
  RxBool nextButtonPressed = false.obs;
  var genderId = 0.obs;

  var ethnicityId = 0.obs;

  @override
  void onInit() {
    genderId.listen((p0) {
      ButtonColorChageWhenAllRequiredFeildAreFilled buttonColorChageWhenAllRequiredFeildAreFilled = Get.find();
      buttonColorChageWhenAllRequiredFeildAreFilled.textValidation();
    });
    ethnicityId.listen((p0) {
      ButtonColorChageWhenAllRequiredFeildAreFilled buttonColorChageWhenAllRequiredFeildAreFilled = Get.find();
      buttonColorChageWhenAllRequiredFeildAreFilled.textValidation();
    });
    super.onInit();
  }

  void textValidation() {
    if (zipCodeController.text.trim().isEmpty) {
      showToast("Zip code can't be empty", color: Colors.red);
    } else if (yearOfBirthController.text.isEmpty) {
      showToast("Year Of Birth can't be empty", color: Colors.red);
    } else if (int.parse(yearOfBirthController.text) >= int.parse(DateFormat('y').format(DateTime.now())) + 1) {
      showToast("Please enter valid year ", color: Colors.red);
    } else if (int.parse(yearOfBirthController.text) <= int.parse(DateFormat('y').format(DateTime.now())) - 120) {
      showToast("Please enter valid year ", color: Colors.red);
    } else if (genderId == 0) {
      showToast("Please select gender", color: Colors.red);
    } else if (ethnicityId == 0) {
      showToast("Please select Race/Ethnicity", color: Colors.red);
    } else {
      apiUpdateUserDeatils(TokenServices.token, zipCodeController.text.trim(), genderId.toString(), ethnicityId.toString(),
          yearOfBirthController.text.trim());
    }
  }

  Future<String> apiUpdateUserDeatils(String token, String zipcode, String user_genderid, String ethnicityid, String dob) async {
    nextButtonPressed.value = true;
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.userDeatilsApiUrl),
        body: ({"zipcode": zipcode, "user_genderid": user_genderid, "ethnicityid": ethnicityid, "dob": dob}),
        headers: ({'Authorization': "Token " + token}));
    nextButtonPressed.value = false;
    var decoded = jsonDecode(response.body);
    showToast(decoded["status"]);
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        Get.to(const AssessmentFormLovedOnesDetailsScreen());
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');

      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }
}
