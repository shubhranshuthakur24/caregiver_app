import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resourece_bundle_menu_common_screen/resoure_bundle_menu_common_screen_services.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class ResourceBundlePageUniversalServices {
  static String selectedResourceBundleName = "";
  static String resourceTypeid = "";

  static Future<String> apiSaveResource(@required int resourceid) async {
    showLoading(title: "saving");
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.saveResourceBundelUrl),
        headers: ({'Authorization': "Token " + TokenServices.token}), body: ({"resourceid": resourceid.toString()}));
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

  static Future<String> apiUnSaveResource(@required int resourceid) async {
    showLoading(title: "Unsaving");
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.UnSaveResourceUrl),
        headers: ({'Authorization': "Token " + TokenServices.token}), body: ({"resourceid": resourceid.toString()}));
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

  static void resourceSaveUnSaveFunction(int toolkit_typeid, bool isSaved) {
    if (isSaved == true) {
      ResourceBundlePageUniversalServices.apiUnSaveResource(toolkit_typeid).then((value) {
        ResourceBundelMenuCommonScreen _respiteScreenServices = Get.find();
        _respiteScreenServices.apiRespiteResource();
        // if (selectedResourceBundleName == "Respite") {
        //   ResourceBundelMenuCommonScreen _respiteScreenServices = Get.find();
        //   _respiteScreenServices.apiRespiteResource();
        // }
        // else if (selectedResourceBundleName == "form") {
        //   ToolKitFormServices _toolKitFormServices = Get.find();
        //   _toolKitFormServices.apiToolKit();
        // } else if (selectedResourceBundleName == "saved") {
        //   ToolKitSavedServices _toolKitSavedServices = Get.find();
        //   _toolKitSavedServices.apiToolKit();
        // }
      });
    } else {
      ResourceBundlePageUniversalServices.apiSaveResource(toolkit_typeid).then((value) {
        ResourceBundelMenuCommonScreen _respiteScreenServices = Get.find();
        _respiteScreenServices.apiRespiteResource();
        // if (selectedResourceBundleName == "Respite") {
        //   ResourceBundelMenuCommonScreen _respiteScreenServices = Get.find();
        //   _respiteScreenServices.apiRespiteResource();
        // }
        // else if (selectedResourceBundleName == "form") {
        //   ToolKitFormServices _toolKitFormServices = Get.find();
        //   _toolKitFormServices.apiToolKit();
        // } else if (selectedResourceBundleName == "saved") {
        //   ToolKitSavedServices _toolKitSavedServices = Get.find();
        //   _toolKitSavedServices.apiToolKit();
        // }
      });
    }
  }
}
