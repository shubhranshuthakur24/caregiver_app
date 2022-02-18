import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_page_universal_services/resource_bundle_page_universal_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resourece_bundle_menu_common_screen/resource_bundle_menu_common_screen_model.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class ResourceBundelMenuCommonScreen extends GetxController {
  RxList data = [].obs;
  RxBool loadFlag = false.obs;

  @override
  void onInit() {
    apiRespiteResource();
    super.onInit();
  }

  Future<dynamic> apiRespiteResource() async {
    data.clear();
    dynamic res;
    try {
      var response = await http.get(Uri.parse(ApiFile.getResourceBunderUrl + ResourceBundlePageUniversalServices.resourceTypeid),
          headers: ({"Authorization": "Token " + TokenServices.token}));
      if (response.statusCode == 200) {
        var decoded = jsonDecode(response.body);
        res = decoded;
        for (var d in decoded["data"]) {
          data.add(ResourceBundleMenuCommonScreenServices.fromJson(d));
          loadFlag.value = true;
        }
      } else {
        loadFlag.value = true;
        print('Request failed with status: ${response.statusCode}.');
        showToast('Request failed with status: ${response.statusCode}.' + "(" + response.body.toString() + ")");
      }
    } catch (exception) {
      loadFlag.value = true;
    }

    return res;
  }
}
