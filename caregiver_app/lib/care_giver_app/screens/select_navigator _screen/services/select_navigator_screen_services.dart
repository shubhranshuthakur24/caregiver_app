import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/care_giver_app/screens/navigator_appointment/navigator_appointment_screen.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import 'controller_select_navigator.dart';

class SelectNavigatorScreenServices {
  static Future<dynamic> apiGetNavigator(@required String token) async {
    dynamic res;
    print("button pressed");
    var response = await http.get(Uri.parse(ApiFile.getNavigatorUrl), headers: ({"Authorization": "Token " + token}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {}
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }

  static Future<String> apiSelectNavigator(
      String token, int navid, String navName, String navProfileUrl, String navAddress) async {
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.selectNavigatorUrl),
        body: ({"navid": navid.toString()}), headers: ({'Authorization': "Token " + token}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      print(decoded.toString());
      res = decoded["status"];
      ControllerSelectNavigator.buttonPressed.value = false;
      if (decoded["status"] == "success") {
        showToast("Successfully Selected");
        Get.off(const NavigatorAppointmentScreen(), arguments: [navid, navName, navProfileUrl, navAddress]);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');

      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }
    return res;
  }
}
