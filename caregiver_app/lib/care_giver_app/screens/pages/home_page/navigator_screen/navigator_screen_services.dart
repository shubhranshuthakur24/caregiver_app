import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:http/http.dart' as http;

import 'navigator_screen_model.dart';

class NavigatorScreenServices extends GetxController {
  static int? navId;
  RxList data = [].obs;

  @override
  void onInit() {
    apiGetNavProfile();
    // TODO: implement onInit
    super.onInit();
  }

  Future<dynamic> apiGetNavProfile() async {
    // showLoading();
    dynamic res;
    print("button pressed");
    var response = await http.get(Uri.parse(ApiFile.getNavProfileUrl + navId.toString()),
        headers: ({"Authorization": "Token " + TokenServices.token}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        data.clear();
        data.add(NavigatorScreenModel.fromJson(decoded["data"][0]));

        // hideLoading();
        // Get.to(const NavigatorScreen(), arguments: [res]);

      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // hideLoading();
    }

    return res;
  }

  ageCalculator() {}
}
