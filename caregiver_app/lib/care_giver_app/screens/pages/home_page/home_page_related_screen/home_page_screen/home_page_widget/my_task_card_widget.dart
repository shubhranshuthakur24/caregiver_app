import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/create_update_task/create_task_update_task_bottom_sheet.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/create_update_task/create_update_task_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_services.dart';
import 'package:intl/intl.dart';

import '../../../../../constants.dart';
import '../home_page_services.dart';

class MyTasksCardWidget extends StatefulWidget {
  const MyTasksCardWidget({Key? key}) : super(key: key);

  @override
  State<MyTasksCardWidget> createState() => _MyTasksCardWidgetState();
}

class _MyTasksCardWidgetState extends State<MyTasksCardWidget> {
  int? value;
  TaskListPageServices _taskListPageServices = Get.put(TaskListPageServices());

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ClampingScrollPhysics(), children: [
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          itemCount: HomePageServices.data[0].tasks.length > 3 ? 3 : HomePageServices.data[0].tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.sp),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      bottom: 10.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () {
                            if (HomePageServices.data[0].tasks[index].isDone == true) {
                              _taskListPageServices.apiUnCompleteTask(
                                  navigator_taskid: HomePageServices.data[0].tasks[index].navigatorTaskid,
                                  ScreenNameFromThisFunctionIsCalled: "HomePageScreen");
                            } else if (HomePageServices.data[0].tasks[index].isDone == false) {
                              _taskListPageServices.apiCompleteTask(
                                  navigator_taskid: HomePageServices.data[0].tasks[index].navigatorTaskid,
                                  ScreenNameFromThisFunctionIsCalled: "HomePageScreen");
                            }
                          },
                          child: HomePageServices.data[0].tasks[index].isDone == true
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
                            _createUpdateTaskServices.navigator_taskid = HomePageServices.data[0].tasks[index].navigatorTaskid;
                            _createUpdateTaskServices.taskEditingController.text = HomePageServices.data[0].tasks[index].taskInfo;
                            if (HomePageServices.data[0].tasks[index].taskCompletionDatetime != "") {
                              _createUpdateTaskServices.selectedDate.value =
                                  DateTime.parse(HomePageServices.data[0].tasks[index].taskCompletionDatetime);
                              _createUpdateTaskServices.selectedTime = TimeOfDay.fromDateTime(
                                  (DateTime.parse(HomePageServices.data[0].tasks[index].taskCompletionDatetime)).toLocal());
                              dateTimeExit = true;
                            }
                            showBottomSheet(
                              context: context,
                              builder: (builder) => CreateTaskUpdateBottomSheetContainer(
                                dateTimeExit: dateTimeExit,
                                ActionName: "Update",
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 240.w,
                                      child: Text(
                                        HomePageServices.data[0].tasks[index].taskInfo.toString(),
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(height: 1.h),
                                HomePageServices.data[0].tasks[index].taskCompletionDatetime.isNotEmpty
                                    ? Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.time,
                                            size: 12.sp,
                                          ),
                                          SizedBox(width: 5.sp),
                                          HomePageServices.data[0].tasks[index].taskCompletionDatetime.isNotEmpty
                                              ? Text(
                                                  "By " +
                                                      DateFormat('yMMMd').format(DateTime.parse(
                                                          HomePageServices.data[0].tasks[index].taskCompletionDatetime)),
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                  ))
                                              : Container(),
                                        ],
                                      )
                                    : Container(),
                                // Container(
                                //   width: 110.w,
                                //   child: const Divider(
                                //     color: Colors.black38,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _taskListPageServices.apiDeleteTask(
                                navigator_taskid: HomePageServices.data[0].tasks[index].navigatorTaskid,
                                ScreenNameFromThisFunctionIsCalled: "HomePageScreen");
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: kConstantGrey,
                            size: 17.0,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                  ),
                  index == 2
                      ? Column(
                          children: [
                            Container(
                              height: 5.h,
                              color: kConstantPaleWhite,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.sp),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => TaskListsPageScreen());
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10.sp),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "View All",
                                        softWrap: true,
                                        style: TextStyle(fontSize: 16.sp, color: kConstantPurple),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            );
          }),
    ]);
  }
}
