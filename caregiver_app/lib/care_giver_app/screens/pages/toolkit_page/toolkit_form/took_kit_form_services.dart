import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_form/tool_kit_form_models.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class ToolKitFormServices extends GetxController {
  RxList toolKitFormDataList = [].obs;

  @override
  void onInit() {
    apiToolKit();
    super.onInit();
  }

  Future<dynamic> apiToolKit() async {
    dynamic res;
    var response =
        await http.get(Uri.parse(ApiFile.getToolKitApiUrl + "3"), headers: ({"Authorization": "Token " + TokenServices.token}));

    if (response.statusCode == 200) {
      toolKitFormDataList.clear();
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        toolKitFormDataList.clear();
        for (var d in decoded["data"]) {
          toolKitFormDataList.add(ToolKitFormModel.fromJson(d));
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }

    return res;
  }
}
