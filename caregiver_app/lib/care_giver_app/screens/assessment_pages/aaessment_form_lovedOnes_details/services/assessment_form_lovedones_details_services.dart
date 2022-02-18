import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/SRC/internationalization_using_getx/language_file.dart';
import 'package:givershealths/SRC/string_manipulation_function/string_manipulation.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/aaessment_form_lovedOnes_details/services/button_color_change_when_all_required_feild_are_filled.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../assessmentpage_emergencyRoom_numberOfTimes.dart';
import '../assessmentpage_lovedOne_diagnosed_with_any_disease_screen.dart';
import '../assessmentpage_relationship_with_lovedone_screen.dart';

class AssessmentFormLovedOnesDetailsServices extends GetxController {
  var genderId = 0.obs;
  var ethnicityId = 0.obs;
  RxBool nextButtonPressed = false.obs;
  int selectedIndexRelationshipWithYourLovedOne = -1;
  List<String> relationshipWithYourLovedOneAnswerList = [
    "I am their Spouse",
    "I am their Adult Child",
    "I am another Relative",
    "I am a Neighbor or Friend",
    "I am their Former Spouse",
    "Other",
  ];
  final List selectedListAssessmetnPageEmergencyRoomLovedOne = [];
  List<String> assessmentPageEmergencyRoomAnswerList = [
    LanguageFile.function1()["Diabetes"].toString(),
    LanguageFile.function1()["Heart Disease"].toString(),
    LanguageFile.function1()["COPD"].toString(),
    LanguageFile.function1()["Cancer"].toString(),
    LanguageFile.function1()["Stroke"].toString(),
    LanguageFile.function1()["Kidney Disease"].toString(),
    LanguageFile.function1()["Dementia or Alzheimer's"].toString(),
    LanguageFile.function1()["Mild cognitive impairment"].toString(),
    "Parkinson's ",
    LanguageFile.function1()["Depression"].toString(),
    LanguageFile.function1()["Hospital admission within the last year"].toString(),
    LanguageFile.function1()["Other serious physical health condition"].toString(),
    LanguageFile.function1()["Other serious mental health condition"].toString()
  ];

  final nameController = TextEditingController();
  final zipCodeControler = TextEditingController();
  final yearOfBirthControler = TextEditingController();

  @override
  void onInit() {
    genderId.listen((p0) {
      LovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled
          lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled = Get.find();
      lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled.textValidation();
    });
    ethnicityId.listen((p0) {
      LovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled
          lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled = Get.find();
      lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled.textValidation();
    });
    super.onInit();
  }

  void textValidation() {
    if (nameController.text.trim().isEmpty) {
      showToast("Name can't be empty", color: Colors.red);
    } else if (zipCodeControler.text.trim().isEmpty) {
      showToast("Zip Code can't be empty", color: Colors.red);
    } else if (yearOfBirthControler.text.trim().isEmpty) {
      showToast("Year Of Birth can't be empty", color: Colors.red);
    } else if (int.parse(yearOfBirthControler.text) >= int.parse(DateFormat('y').format(DateTime.now())) + 1) {
      showToast("Please enter valid year ", color: Colors.red);
    } else if (int.parse(yearOfBirthControler.text) <= int.parse(DateFormat('y').format(DateTime.now())) - 120) {
      showToast("Please enter valid year ", color: Colors.red);
    } else if (genderId == 0) {
      showToast("Please select gender", color: Colors.red);
    } else if (ethnicityId == 0) {
      showToast("Please select Race/Ethnicity", color: Colors.red);
    } else {
      Get.to(const AssessmentPageRelationshipWithLovedOneScreeen());
    }
  }

  void formValidationAssessmentPageRelationshipWithLovedOne() {
    if (selectedIndexRelationshipWithYourLovedOne == -1) {
      showToast("Please select relationship with your loved one", color: Colors.red);
    } else {
      Get.to(const assessmentpage_q2_diagnosed_with_any());
    }
  }

  Future<String> apiUpdateLovedOneDeatils() async {
    nextButtonPressed.value = true;
    String res = "";
    List<String> nameList = StringManipulation.nameSplit(fullname: nameController.text.trim());

    var response = await http.post(Uri.parse(ApiFile.updateLovedOneDetailsApiUrl),
        body: ({
          "first_name": nameList[0],
          "last_name": nameList[1],
          "zipcode": zipCodeControler.text,
          "user_genderid": genderId.toString(),
          "ethnicityid": ethnicityId.toString(),
          "dob": yearOfBirthControler.text,

          "relationship_id": selectedIndexRelationshipWithYourLovedOne.toString(),
          "disease_id": selectedListAssessmetnPageEmergencyRoomLovedOne.toString()
          // "disease_id": ["1","7"].toString()
        }),
        headers: ({'Authorization': "Token " + TokenServices.token}));
    nextButtonPressed.value = false;

    var decoded = jsonDecode(response.body);
    showToast(decoded["status"]);
    res = decoded["status"];
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        Get.to(AssessmentPage3());
      }
    } else {
      nextButtonPressed.value = false;
      print('Request failed with status: ${response.statusCode}.');
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }
}
