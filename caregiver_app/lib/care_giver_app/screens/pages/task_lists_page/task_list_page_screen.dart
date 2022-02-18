import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_Page_widget.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_services.dart';

import '../../constants.dart';

class TaskListsPageScreen extends StatefulWidget {
  const TaskListsPageScreen({Key? key}) : super(key: key);

  @override
  _TaskListsPageScreenState createState() => _TaskListsPageScreenState();
}

class _TaskListsPageScreenState extends State<TaskListsPageScreen> {
  TaskListPageServices _taskListPageServices = Get.put(TaskListPageServices());

  @override
  void initState() {
    // TODO: implement initState
    _taskListPageServices.apiGetTaskList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: SteelGrey,
          // appBar: AppBar(
          //   // backgroundColor: kConstantPurple,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   centerTitle: true,
          //   title: const Text(
          //     "List",
          //     style: TextStyle(color: kBlueGreyTextColor),
          //   ),
          //   // actions: [UserImageWidget(), SizedBox(width: 20.sp)],
          // ),
          body: SafeArea(
            child: Obx(() {
              return _taskListPageServices.apiLoadIsCompleate.isFalse
                  ? Container(
                      child: Center(
                        child: showSpinkitRing(color: kConstantPurple),
                      ),
                    )
                  : Container(
                      width: 812.h,

                      // decoration: kConstantGradientNew(),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 0, bottom: 24.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              height: 72.h,
                              constraints: BoxConstraints(maxHeight: 72.h, maxWidth: 327.w),
                              child: Text("Task List",
                                  style: TextStyle(
                                      fontSize: 36.sp,
                                      fontFamily: 'TTCommons-Bold',
                                      fontWeight: FontWeight.bold,
                                      color: kBlueGreyTextColor)),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: _taskListPageServices.taskList.length,
                                  itemBuilder: (BuildContext, index) {
                                    return ContainerListViewBuilderScreenWidget(index: index);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            }),
          )),
    );
  }
}
