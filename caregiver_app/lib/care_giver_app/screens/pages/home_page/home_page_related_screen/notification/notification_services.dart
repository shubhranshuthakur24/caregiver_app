import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/notification/notification_model.dart';
import 'package:http/http.dart' as http;

class NotificationServices extends GetxController {
  RxList notificationList = [].obs;
  RxBool LoadApiGetTaskList = false.obs;

  @override
  void onInit() {
    apiGetTaskList();
    super.onInit();
  }

  Future<dynamic> apiGetTaskList() async {
    dynamic res;
    var response =
        await http.get(Uri.parse(ApiFile.GetNotificationUrl), headers: ({"Authorization": "Token " + TokenServices.token}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        for (var data in decoded["data"]) {
          notificationList.add(NotificationModel.fromJson(data));
          LoadApiGetTaskList.value = true;
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }
}
