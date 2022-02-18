import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/main_home_page.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import 'calander_popup_screen.dart';
import 'model_available_slot.dart';

class CalendarServices extends GetxController {
  static final RxString selectedDate = "".obs;
  static final RxList<dynamic> totalNavAvailableSlotsData = [].obs;
  static final RxList<dynamic> availableSlotsBySelectedDate = [].obs;
  static int slotid = 0;
  static late int navid = 0;
  static late String navName;
  static late String navProfileUrl;
  static late String navAddress;
  static late String screenNameWhereCalanderUsed;
  static RxBool confirmButtonPressed = false.obs;
  static late String availabilityId;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();

    apiGetAvilableSlot2();
    ever(selectedDate, (value) {
      availableSlotsBySelectedDate.clear();
      for (var data in totalNavAvailableSlotsData) {
        if (data.date == selectedDate.value.toString()) {
          availabilityId = data.availabilityId.toString();
          availableSlotsBySelectedDate.clear();
          slotid = 0;
          availableSlotsBySelectedDate.addAll(data.availableSlots);
          // for (var data in data.availableSlots) {
          //   availableSlotsbySelectedDate.add(data);
          //   print(data.slotStartTime);
          // }
        }
      }
    });
  }

  static Future<dynamic> apiGetAvilableSlot2() async {
    totalNavAvailableSlotsData.clear();
    dynamic res;
    print("button pressed");
    var response = await http.get(Uri.parse(ApiFile.getgetAvailableSlotsUrl + "?nav_id=" + navid.toString()),
        headers: ({"Authorization": "Token " + TokenServices.token}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      print("Sameer Singh");
      print("apiGetAvilableSlot");
      print(navid.toString());
      print(TokenServices.token);
      print(decoded.toString());
      if (decoded["status"] == "success") {
        for (var data in decoded["data"] ?? []) {
          totalNavAvailableSlotsData.add(ModelAvailableSlot.fromJson(data));
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    for (var data in totalNavAvailableSlotsData) {
      DateTime dateTime = DateTime.parse(data.date);

      CalanderPopUpScreen.availableSlotDateList.add(dateTime);
    }
    return res;
  }

  static Future<dynamic> apiBookSlot(@required String token, @required int nav_id, @required int availabilityid,
      @required int slotId, @required int meeting_typeid) async {
    confirmButtonPressed.value = true;
    dynamic res;
    print("Sameer Singh");
    print("apiBookSlot");
    print(slotid.toString());
    print(nav_id.toString());
    print(availabilityId);
    print(meeting_typeid.toString());
    print(selectedDate.value.toString());
    if (nav_id == 0) {
      showToast("Something Went Wrong Please Restart App", color: Colors.red);
    } else if (slotId == 0) {
      confirmButtonPressed.value = false;
      showToast("Please Select One Slot", color: Colors.red);
    } else {
      var response = await http.post(Uri.parse(ApiFile.getBookSlotUrl),
          body: {
            "nav_id": nav_id.toString(),
            "availabilityid": availabilityId,
            "slotid": slotid.toString(),
            "meeting_typeid": meeting_typeid.toString(),
            // "date": selectedDate.value.toString()
          },
          headers: ({"Authorization": "Token " + token}));
      confirmButtonPressed.value = false;
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        res = decoded;
        if (decoded["status"] == "success") {
          showToast("Sucessfully Slot Booked" + nav_id.toString() + "  " + slotid.toString() + " " + selectedDate.toString());

          print("Sucessfully Slot Booked");
          slotid = 0;
          if (screenNameWhereCalanderUsed == "NavigatorAppointmentScreen") {
            Get.offAll(const MainHomePage());
          } else if (screenNameWhereCalanderUsed == "HomePage") {
            HomePageServices.apiGetCareGiverDetails(TokenServices.token);
            Get.back();
          }
        }
      } else {
        showToast('Request failed with status: ${response.statusCode}.', color: Colors.red);
        print('Request failed with status: ${response.statusCode}.');
      }
    }

    return res;
  }


}
