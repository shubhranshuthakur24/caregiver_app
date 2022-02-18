import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:http/http.dart' as http;

class ResourceDetailScreenServices extends GetxController {
  RxBool ApiLoadFlag = false.obs;
  RxString resourceid = "".obs;
  RxString banner_pic_url = "".obs;
  RxString website_url = "".obs;
  RxString info = "".obs;
  RxString cost = "".obs;
  RxString eligibility = "".obs;
  RxString email = "".obs;
  RxString phone = "".obs;
  RxString title = "".obs;
  RxBool isSaved = false.obs;
  RxString resource_type = "".obs;
  RxString format="".obs;

  Future<void> apiGetResourceDetials() async {
    try {
      var response = await http.get(Uri.parse(ApiFile.getResourceDetailsApiUrl + resourceid.value),
          headers: ({"Authorization": "Token " + TokenServices.token}));
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        if (decoded["status"] == "success") {
          banner_pic_url.value = decoded["data"]["banner_pic_url"] ?? "";
          website_url.value = decoded["data"]["website_url"] ?? "";
          info.value = decoded["data"]["info"] ?? "";
          cost.value = decoded["data"]["cost"] ?? "";
          eligibility.value = decoded["data"]["eligibility"] ?? "";
          email.value = decoded["data"]["email"] ?? "";
          phone.value = decoded["data"]["phone"] ?? "";
          title.value = decoded["data"]["title"] ?? "";
          isSaved.value = decoded["data"]["is_saved"] ?? false;
          resource_type.value = decoded["data"]["resource_type"] ?? "";
          format.value=decoded["data"]["format"] ?? "";
        }
        ApiLoadFlag.value = true;
      } else {
        ApiLoadFlag.value = true;
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      ApiLoadFlag.value = true;
    }
  }
}
