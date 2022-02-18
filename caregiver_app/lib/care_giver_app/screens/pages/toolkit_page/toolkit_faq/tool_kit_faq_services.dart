import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_faq/took_kit_faq_models.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class ToolKitFaqServices extends GetxController {
  static RxList dataList = [].obs;

  @override
  void onInit() async {
    dataList.clear();
    apiToolKit();
    super.onInit();
  }

  static Future<dynamic> apiToolKit() async {
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showLoading());
    dynamic res;

    var response =
        await http.get(Uri.parse(ApiFile.getToolKitApiUrl + "2"), headers: ({"Authorization": "Token " + TokenServices.token}));
    // hideLoading();
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        for (var d in decoded["data"]) {
          dataList.add(ToolKitFaqModels.fromJson(d));
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      // hideLoading();
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }

    return res;
  }
}
