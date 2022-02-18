import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import 'assessmentpage_anythingelseWeShouldKnow.dart';
import 'assessments_pages_end.dart';

class AssessmentPagesSerivces extends GetxController {
  RxBool submitButtonPressed = false.obs;
  List ansData = [];
  String? primary_ins;
  String? secondary_ins;
  String? longterm_ins;
  String? priority;
  String? moreinfo;

  void submitAns(int qid, int aid) {
    ansData.removeWhere((element) => element["qid"] == qid.toString());
    Map mapData = {};
    mapData["qid"] = qid.toString();
    mapData["aid"] = (aid + 1).toString();
    ansData.add(mapData);
  }

  Future<String> apiSaveAssessmentApi() async {
    String res = "";
    submitButtonPressed.value = true;
    var response = await http.post(Uri.parse(ApiFile.saveAssessmenApiUrl),
        headers: ({"Authorization": "Token " + TokenServices.token}),
        body: ({
          "signup_qa": jsonEncode(ansData),
          "primary_ins": primary_ins ?? "",
          "secondary_ins": secondary_ins ?? "",
          "longterm_ins": longterm_ins ?? ""
        }));
    submitButtonPressed.value = false;
    var decoded = jsonDecode(response.body);
    showToast(decoded["status"]);
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        Get.to(const AssessmentPagesEndScreen());
        // Get.to(const AssessmentPage20ForText());
      }
    } else {
      submitButtonPressed.value = false;
      showToast('Request failed with status: ${response.statusCode}.');
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }
}
