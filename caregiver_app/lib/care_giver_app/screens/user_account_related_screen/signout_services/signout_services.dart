import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/care_giver_to_navigator_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/static_variable.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/my_loved_one_screen/my_loved_one_sevices.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/navigator_screen/navigator_screen_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_faq/tool_kit_faq_services.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/signin_screen.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class SignOutSerives {
  static deleteAllAppData() {
    MyLovedOneServices.loved_one_id = null;
    NavigatorScreenServices.navId = null;
    HomePageServices.data.clear();
    ToolKitFaqServices.dataList.clear();
    StaticVariable.navFirebaseId = "";
    StaticVariable.navFirstName.value = "";
    StaticVariable.navLastName = "";
    StaticVariable.careGiverFirstName = "";
    StaticVariable.careGiverLastName = "";
    StaticVariable.chatRoomId = "";
    StaticVariable.navProfileUrl = "";
    CareGiverToNavigatorServices.taskDone.value = false;
  }

  static Future<String> apiSignOut(@required String token) async {
    print(token);
    String res = "";
    print("button pressed");
    var response = await http.post(Uri.parse(ApiFile.signOutApiUrl), headers: ({"Authorization": "Token " + token}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded["status"];
      showToast(decoded["status"]);
      if (decoded["status"] == "success") {
        TokenServices.tokenDelete();
        SignOutSerives.deleteAllAppData();
        Get.offAll(SignInScreen());
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }
}
