import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_education/toolkit_education_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_form/took_kit_form_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_saved/tool_kit_saved_sevices.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class ToolKitPageUniversalServices {
  static late String screeName;

  static String durationFormatting(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    if (parts[0].padLeft(2, '0') == "00") {
      return parts[1].padLeft(2, '0') + "m";
    } else if (parts[1].padLeft(2, '0') == "00") {
      return parts[0].padLeft(2, '0') + "h";
    } else {
      return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
    }
  }

  static Future<String> apiSaveToolKit(@required int toolkitid) async {
    showLoading(title: "saving");
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.saveToolKitUrl),
        headers: ({'Authorization': "Token " + TokenServices.token}), body: ({"toolkitid": toolkitid.toString()}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded["status"];
      hideLoading();
      if (decoded["status"] == "success") {
        showToast("Successfully Saved");
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      hideLoading();
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }

  static Future<String> apiUnSaveToolKit(@required int toolkitid) async {
    showLoading(title: "Unsaving");
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.UnSaveToolKitUrl),
        headers: ({'Authorization': "Token " + TokenServices.token}), body: ({"toolkitid": toolkitid.toString()}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded["status"];
      hideLoading();
      if (decoded["status"] == "success") {
        showToast("Successfully Unsaved");
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      hideLoading();
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }

  static void toolKitSaveUnSaveFunction(int toolkit_typeid, bool isSaved) {
    if (isSaved == true) {
      ToolKitPageUniversalServices.apiUnSaveToolKit(toolkit_typeid).then((value) {
        if (screeName == "education") {
          ToolkitEducationServices _toolkitEducationServices = Get.find();
          _toolkitEducationServices.apiToolKit();
        } else if (screeName == "form") {
          ToolKitFormServices _toolKitFormServices = Get.find();
          _toolKitFormServices.apiToolKit();
        } else if (screeName == "saved") {
          ToolKitSavedServices _toolKitSavedServices = Get.find();
          _toolKitSavedServices.apiToolKit();
        }
      });
    } else {
      ToolKitPageUniversalServices.apiSaveToolKit(toolkit_typeid).then((value) {
        if (screeName == "education") {
          ToolkitEducationServices _toolkitEducationServices = Get.find();
          _toolkitEducationServices.apiToolKit();
        } else if (screeName == "form") {
          ToolKitFormServices _toolKitFormServices = Get.find();
          _toolKitFormServices.apiToolKit();
        } else if (screeName == "saved") {
          ToolKitSavedServices _toolKitSavedServices = Get.find();
          _toolKitSavedServices.apiToolKit();
        }
      });
    }
  }
}
