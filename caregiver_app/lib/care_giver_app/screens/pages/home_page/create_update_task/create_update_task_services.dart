import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/calander/calendar_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_services.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class CreateUpdateTaskServices extends GetxController {
  RxBool buttonPressed = false.obs;
  var selectedDate = DateTime.now().obs;
  TimeOfDay selectedTime = TimeOfDay.now();
  final taskEditingController = TextEditingController();
  late int navigator_taskid;
  bool visibleFlagDateTime = false;
  bool visibleFlagSelectDateTimeButton = true;

  DateTime join(DateTime date, TimeOfDay time) {
    return new DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  void formValidation({required String ActionName}) {
    if (taskEditingController.text.trim().isEmpty) {
      showToast("Task field can't be empty");
    } else {
      if (ActionName == "Add") {
        apiAddTask(CalendarServices.navid, taskEditingController.text, join(selectedDate.value, selectedTime).toUtc().toString());
      } else if (ActionName == "Update") {
        apiUpdateTask(
            navigator_taskid: navigator_taskid,
            task: taskEditingController.text,
            deadline: join(selectedDate.value, selectedTime).toString());
      }
    }
  }

  Future<dynamic> apiAddTask(@required int nav_id, @required String task, @required String deadline) async {
    buttonPressed.value = true;
    dynamic res;
    var response = await http.post(Uri.parse(ApiFile.addTaskUrl),
        body: visibleFlagDateTime == true
            ? {
                "nav_id": nav_id.toString(),
                "task": task,
                "deadline": deadline,
              }
            : {
                "nav_id": nav_id.toString(),
                "task": task,
              },
        headers: ({"Authorization": "Token " + TokenServices.token}));
    buttonPressed.value = false;
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        HomePageServices.apiGetCareGiverDetails(TokenServices.token);
        taskEditingController.text = "";
        showToast("Task suceesfully added");
        Get.back();
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return res;
  }

  Future<dynamic> apiUpdateTask({required int navigator_taskid, required String task, required String deadline}) async {
    buttonPressed.value = true;
    dynamic res;
    var response = await http.post(Uri.parse(ApiFile.UpdateTaskUrl),
        body: {
          "navigator_taskid": navigator_taskid.toString(),
          "task_info": task,
          "task_completion_datetime": deadline,
        },
        headers: ({"Authorization": "Token " + TokenServices.token}));
    buttonPressed.value = false;
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded;
      if (decoded["status"] == "success") {
        HomePageServices.apiGetCareGiverDetails(TokenServices.token);
        taskEditingController.text = "";
        showToast("Task successfully updated");
        TaskListPageServices _taskListPageServices = Get.put(TaskListPageServices());
        _taskListPageServices.apiGetTaskList();

        Get.back();
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return res;
  }
}
