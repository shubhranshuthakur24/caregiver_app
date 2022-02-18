import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/create_update_task/create_task_update_task_bottom_sheet.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/create_update_task/create_update_task_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_services.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class ContainerListViewBuilderScreenWidget extends StatefulWidget {
  int index;

  ContainerListViewBuilderScreenWidget({required this.index});

  @override
  _ContainerListViewBuilderScreenWidgetState createState() => _ContainerListViewBuilderScreenWidgetState();
}

class _ContainerListViewBuilderScreenWidgetState extends State<ContainerListViewBuilderScreenWidget> {
  TaskListPageServices _taskListPageServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (_taskListPageServices.taskList[widget.index].isDone == true) {
                _taskListPageServices.apiUnCompleteTask(
                    navigator_taskid: _taskListPageServices.taskList[widget.index].navigatorTaskid);
              } else if (_taskListPageServices.taskList[widget.index].isDone == false) {
                _taskListPageServices.apiCompleteTask(
                    navigator_taskid: _taskListPageServices.taskList[widget.index].navigatorTaskid);
              }
            },
            child: _taskListPageServices.taskList[widget.index].isDone == true
                ? Icon(
                    Icons.check_circle_outlined,
                    color: kConstantPurple,
                    size: 20.0,
                  )
                : Icon(
                    CupertinoIcons.circle,
                    color: kConstantPurple,
                    size: 20.0,
                  ),
          ),
          SizedBox(
            width: 7.w,
          ),
          InkWell(
            onTap: () {
              bool dateTimeExit = false;
              Get.delete<CreateUpdateTaskServices>();
              CreateUpdateTaskServices _createUpdateTaskServices = Get.put(CreateUpdateTaskServices());
              _createUpdateTaskServices.navigator_taskid = _taskListPageServices.taskList[widget.index].navigatorTaskid;
              _createUpdateTaskServices.taskEditingController.text =
                  _taskListPageServices.taskList[widget.index].taskInfo.toString();
              if (_taskListPageServices.taskList[widget.index].taskCompletionDatetime != "") {
                _createUpdateTaskServices.selectedDate.value =
                    DateTime.parse(_taskListPageServices.taskList[widget.index].taskCompletionDatetime);
                _createUpdateTaskServices.selectedTime =
                    TimeOfDay.fromDateTime((DateTime.parse(_taskListPageServices.taskList[widget.index].taskCompletionDatetime)
                    ).toLocal());
                dateTimeExit = true;
              }
              showBottomSheet(
                context: context,
                builder: (builder) => CreateTaskUpdateBottomSheetContainer(
                  ActionName: "Update",
                  dateTimeExit: dateTimeExit,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250.w,
                  child: Text(
                    _taskListPageServices.taskList[widget.index].taskInfo.toString(),
                    softWrap: true,
                    maxLines: 3,
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                ),
                SizedBox(height: 1.h),
                _taskListPageServices.taskList[widget.index].taskCompletionDatetime.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            size: 12.sp,
                          ),
                          SizedBox(width: 5.sp),
                          _taskListPageServices.taskList[widget.index].taskCompletionDatetime.isNotEmpty
                              ? Text(
                                  "By " +
                                      DateFormat('yMMMd').format(
                                          DateTime.parse(_taskListPageServices.taskList[widget.index].taskCompletionDatetime)),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ))
                              : Container(),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              _taskListPageServices.apiDeleteTask(navigator_taskid: _taskListPageServices.taskList[widget.index].navigatorTaskid);
            },
            child: Icon(
              Icons.delete_outline,
              color: kConstantGrey,
              size: 17.0,
            ),
          )
        ],
      ),
    );
  }
}
