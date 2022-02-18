import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';
import 'model_tool_kit_model.dart';

class ToolkitEducationServices extends GetxController {
  RxList data = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    apiToolKit();
    super.onInit();
  }

  Future<dynamic> apiToolKit() async {
    dynamic res;
    var response = await http.get(Uri.parse(ApiFile.getToolKitApiUrl + 1.toString()),
        headers: ({"Authorization": "Token " + TokenServices.token}));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        data.clear();
        for (var d in decoded["data"]) {
          data.add(ModelToolKit.fromJson(d));
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
      showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
    }

    return res;
  }
}
