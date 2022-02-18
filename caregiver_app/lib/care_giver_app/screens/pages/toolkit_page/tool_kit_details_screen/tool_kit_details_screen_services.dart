import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_details_screen/tool_kit_details_screen_model.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_education/toolkit_education_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_form/took_kit_form_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_saved/tool_kit_saved_sevices.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import '../tool_kit_page_universal_services.dart';

class ToolKitDetailsScreenServices extends GetxController {
  static late int toolkitid;

  RxList dataToolKitDetails = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    apiToolKitDetails(toolkitid);
    super.onInit();
  }

  Future<dynamic> apiToolKitDetails(@required int toolkitid) async {
    dynamic res;
    var response = await http.get(Uri.parse(ApiFile.getToolKitDetailsApiUrl + toolkitid.toString()),
        headers: ({"Authorization": "Token " + TokenServices.token}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      dataToolKitDetails.clear();
      dataToolKitDetails.add(ToolKitDetailsScreenModel.fromJson(decoded["data"]));
    } else {
      print('Request failed with status: ${response.statusCode}.');
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }

    return res;
  }

  void afterToolKitSaveUnsavePreviousScreenRefresh() {
    if (ToolKitPageUniversalServices.screeName == "education") {
      ToolkitEducationServices _toolkitEducationServices = Get.find();
      _toolkitEducationServices.apiToolKit();
    } else if (ToolKitPageUniversalServices.screeName == "form") {
      ToolKitFormServices _toolKitFormServices = Get.find();
      _toolKitFormServices.apiToolKit();
    } else if (ToolKitPageUniversalServices.screeName == "saved") {
      ToolKitSavedServices _toolKitSavedServices = Get.find();
      _toolKitSavedServices.apiToolKit();
    }
  }

  void toolKitSaveUnSaveFunction(int toolkitid, bool isSaved) {
    if (isSaved == true) {
      ToolKitPageUniversalServices.apiUnSaveToolKit(toolkitid).then((value) {
        apiToolKitDetails(toolkitid).then((value) {
          afterToolKitSaveUnsavePreviousScreenRefresh();
        });
      });
    } else if (isSaved == false) {
      ToolKitPageUniversalServices.apiSaveToolKit(toolkitid).then((value) {
        apiToolKitDetails(toolkitid).then((value) {
          afterToolKitSaveUnsavePreviousScreenRefresh();
        });
      });
    }
  }
}
