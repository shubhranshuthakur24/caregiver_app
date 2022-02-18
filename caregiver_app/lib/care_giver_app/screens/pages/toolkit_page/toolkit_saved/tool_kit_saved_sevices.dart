import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_saved/tool_kit_saved_models.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class ToolKitSavedServices extends GetxController {
  RxList toolKitSavedDataList = [].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    toolKitSavedDataList.clear();
    apiToolKit();
    super.onInit();
  }

  Future<dynamic> apiToolKit() async {
    try {
      dynamic res;
      var response =
          await http.get(Uri.parse(ApiFile.getSavedToolKitApiUrl), headers: ({"Authorization": "Token " + TokenServices.token}));

      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        res = decoded;
        if (decoded["status"] == "success") {
          toolKitSavedDataList.clear();
          for (var d in decoded["data"]) {
            toolKitSavedDataList.add(ToolKitSavedModels.fromJson(d));
          }
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');

        showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
      }
      loading.value = false;
      return res;
    } catch (error) {
      loading.value = false;
    }
  }
}
