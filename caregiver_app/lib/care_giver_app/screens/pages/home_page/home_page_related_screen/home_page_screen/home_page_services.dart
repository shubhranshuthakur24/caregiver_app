import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/calander/calendar_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/static_variable.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import 'home_page_model.dart';

class HomePageServices extends GetxController {
  static String meetingDay = "";
  static String meetingMonth = "";
  static RxList data = [].obs;
  DateTime? currentBackPressTime;
  static String userPost = "";
  static bool isEditingText = false;
  static late TextEditingController editingController;
  static String initialText =
      "It can be helpful to have a grounding phrase in times of stress. What’s something you tell yourself when times are difficult? Feel free to add here 📝";

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    var d;
    await apiGetCareGiverDetails(TokenServices.token).then((value) => d = value);
    HomePageModel a = HomePageModel.fromJson(d["data"]);

    final controllerServicesCalander = Get.put(CalendarServices());
    CalendarServices.navid = a.navigatorData!.navigatorid!;
    CalendarServices.navName = a.navigatorData!.navFirstName.toString() + " " + a.navigatorData!.navLastName.toString();
    CalendarServices.apiGetAvilableSlot2();
  }

  static Future<dynamic> apiGetCareGiverDetails(@required String token) async {
    dynamic res;
    var response = await http.get(Uri.parse(ApiFile.getCareGiverDetailsUrl), headers: ({"Authorization": "Token " + token}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);

      res = decoded;
      if (decoded["status"] == "success") {
        StaticVariable.navFirebaseId = res["data"]["navigator_data"]["nav_firebaseid"];
        HomePageModel a = HomePageModel.fromJson(res["data"]);
        userProfileUrlUniversal.value = a.cgProfilePic.toString();
        StaticVariable.navLastName = a.navigatorData!.navLastName.toString();
        StaticVariable.careGiverFirstName = a.cgFirstName.toString();
        StaticVariable.careGiverLastName = a.cgLastName.toString();
        StaticVariable.navProfileUrl = a.navigatorData!.navProfilePic!;
        StaticVariable.navFirstName.value = a.navigatorData!.navFirstName.toString();
        // StaticVariable.careGiverProfileUrl = a.cgProfilePic;
        data.clear();
        data.add(a);
        try {
          dateParseing();
        } catch (error) {}
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }

  void doubleClickAppExit() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
    } else {
      if (GetPlatform.isAndroid) {
        SystemNavigator.pop();
      } else {
        exit(0);
      }
    }
  }

  static dateParseing() {
    String date = HomePageServices.data[0].navigatorData.date;
    // String date = "2021-12-01";
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(date);
    String formatedDate = DateFormat.MMMMd().format(tempDate).toString();
    String day = formatedDate.split(" ")[1];
    String sortedMonth = "";
    for (int i = 0; i < 3; i++) {
      sortedMonth = sortedMonth + formatedDate[i];
    }

    meetingMonth = sortedMonth;
    meetingDay = day;
  }
}
