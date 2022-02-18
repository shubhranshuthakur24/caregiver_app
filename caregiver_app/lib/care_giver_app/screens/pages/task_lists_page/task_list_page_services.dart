import 'dart:convert';

import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_model.dart';
import 'package:http/http.dart' as http;

class TaskListPageServices extends GetxController {
  RxList taskList = [].obs;
  RxBool apiLoadIsCompleate = false.obs;

  Future<dynamic> apiGetTaskList() async {
    dynamic res;
    var response =
        await http.get(Uri.parse(ApiFile.GetTaskListUrl), headers: ({"Authorization": "Token " + TokenServices.token}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        taskList.clear();
        apiLoadIsCompleate.value = true;
        for (var data in decoded["data"]) {
          taskList.add(TaskListModel.fromJson(data));
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }

  Future<dynamic> apiCompleteTask(
      {required int navigator_taskid, String ScreenNameFromThisFunctionIsCalled = "TaskListPage"}) async {
    showLoading(title: "Loading");
    dynamic res;
    var response = await http.post(Uri.parse(ApiFile.CompleteTaskUrl),
        headers: ({"Authorization": "Token " + TokenServices.token}), body: ({"navigator_taskid": navigator_taskid.toString()}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        if (ScreenNameFromThisFunctionIsCalled == "TaskListPage") {
          apiGetTaskList();
        } else if (ScreenNameFromThisFunctionIsCalled == "HomePageScreen") {
          HomePageServices.apiGetCareGiverDetails(TokenServices.token);
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    hideLoading();
    return res;
  }

  Future<dynamic> apiUnCompleteTask(
      {required int navigator_taskid, String ScreenNameFromThisFunctionIsCalled = "TaskListPage"}) async {
    showLoading(title: "Loading");
    dynamic res;
    var response = await http.post(Uri.parse(ApiFile.UnCompleteTaskUrl),
        headers: ({"Authorization": "Token " + TokenServices.token}), body: ({"navigator_taskid": navigator_taskid.toString()}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (ScreenNameFromThisFunctionIsCalled == "TaskListPage") {
        apiGetTaskList();
      } else if (ScreenNameFromThisFunctionIsCalled == "HomePageScreen") {
        HomePageServices.apiGetCareGiverDetails(TokenServices.token);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    hideLoading();
    return res;
  }

  Future<dynamic> apiDeleteTask(
      {required int navigator_taskid, String ScreenNameFromThisFunctionIsCalled = "TaskListPage"}) async {
    showLoading(title: "Deleting");
    dynamic res;
    var response = await http.post(Uri.parse(ApiFile.DeleteTaskUrl),
        headers: ({"Authorization": "Token " + TokenServices.token}), body: ({"navigator_taskid": navigator_taskid.toString()}));

    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        if (ScreenNameFromThisFunctionIsCalled == "TaskListPage") {
          apiGetTaskList();
        } else if (ScreenNameFromThisFunctionIsCalled == "HomePageScreen") {
          HomePageServices.apiGetCareGiverDetails(TokenServices.token);
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    hideLoading();
    return res;
  }
}
