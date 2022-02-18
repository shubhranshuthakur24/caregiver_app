import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_screen.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class UserBioServices extends GetxController {
  var data;

  static Future<dynamic> apiGetCgProfile({String navigateMethod = "to"}) async {
    showLoading();
    dynamic res;

    var response =
        await http.get(Uri.parse(ApiFile.getCgProifleUrl), headers: ({"Authorization": "Token " + TokenServices.token}));
    hideLoading();
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        if (navigateMethod == "to") {
          Get.to(const UserBioScreen(), arguments: [decoded]);
        } else {
          Get.offAll(const UserBioScreen(), arguments: [decoded]);
        }
      }
    } else {
      hideLoading();
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }

  static String ageCalculator(String dob) {
    var dobSplit = dob.split("-");
    int age = DateTime.now().year.toInt() - int.parse(dobSplit.last);
    return age.toString();
  }
}
