import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_services.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';

class CancelMeetingServices extends GetxController {
  RxBool buttonPressed = false.obs;

  Future<dynamic> cancelMeetingApiFunction({required String CancelReson}) async {
    print("Sameer Singh");
    print(TokenServices.userid);
    print(HomePageServices.data[0].navigatorData.meetingid.toString());
    print(CancelReson);
    buttonPressed.value = true;
    dynamic res;
    var response = await http.post(Uri.parse(ApiFile.CancelMeetingUrl),
        body: {
          "user_id": TokenServices.userid,
          "meeting_id": HomePageServices.data[0].navigatorData.meetingid.toString(),
          "cancelled_reason": CancelReson
        },
        headers: ({"Authorization": "Token " + TokenServices.token}));
    buttonPressed.value = false;
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        showToast("Successfully Meeting Canceled");
        HomePageServices.apiGetCareGiverDetails(TokenServices.token);
        Get.back();
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }
}
