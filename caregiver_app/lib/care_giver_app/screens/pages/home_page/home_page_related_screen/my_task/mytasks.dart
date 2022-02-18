import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/homepage_widgets.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_screen.dart';

import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../home_page_screen/home_page_services.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

class MyTasks extends StatefulWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  int? value;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ClampingScrollPhysics(), children: [
      ListView.builder(
          shrinkWrap: true,
          // physics: ClampingScrollPhysics(),
          itemCount: HomePageServices.data[0].tasks.length > 3 ? 3 : HomePageServices.data[0].tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        HomePageServices.data[0].tasks.reversed.toList()[index].taskInfo.toString(),
                        softWrap: true,
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      InkWell(
                        child: Icon(Icons.more_vert),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => SimpleDialog(
                                    insetPadding: EdgeInsets.all(50.sp),
                                    title: const Text('Are you sure you want to cancel the task?'),
                                    children: [
                                      Row(
                                        children: [
                                          DialogButton(
                                            text: "YES",
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          DialogButton(
                                            text: "NO",
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      )
                                    ],
                                  ));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.time,
                        size: 12.sp,
                      ),
                      SizedBox(width: 5.sp),
                      HomePageServices.data[0].tasks.reversed.toList()[index].taskCompletionDatetime.isNotEmpty
                          ? Text(
                              DateFormat('MMMM dd').format(
                                  DateTime.parse(HomePageServices.data[0].tasks.reversed.toList()[index].taskCompletionDatetime)),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ))
                          : Container(),
                    ],
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  // RadioListTile(
                  //   contentPadding: EdgeInsets.only(left: 5.sp),
                  //   toggleable: true,
                  //   value: index,
                  //   groupValue: value,
                  //   onChanged: (v) => setState(() => value = index),
                  //   title: Text(
                  //     HomePageServices.data[0].tasks.reversed
                  //         .toList()[index]
                  //         .taskInfo
                  //         .toString(),
                  //     // HomePageController.data[0].tasks[index].taskInfo.toString()
                  //
                  //     style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  //   ),
                  //   subtitle: Row(
                  //     children: [
                  //       Icon(
                  //         CupertinoIcons.time,
                  //         size: 12.sp,
                  //       ),
                  //       SizedBox(width: 5.sp),
                  //       HomePageServices.data[0].tasks.reversed
                  //               .toList()[index]
                  //               .taskCompletionDatetime
                  //               .isNotEmpty
                  //           ? Text(
                  //               DateFormat('MMMM dd').format(DateTime.parse(
                  //                   HomePageServices.data[0].tasks.reversed
                  //                       .toList()[index]
                  //                       .taskCompletionDatetime)),
                  //               style: TextStyle(
                  //                 fontSize: 12.sp,
                  //               ))
                  //           : Container(),
                  //     ],
                  //   ),
                  //   activeColor: kConstantPurple,
                  // ),
                  // const Divider(
                  //   color: Colors.black,
                  // ),
                ],
              ),
            );
          }),
      Padding(
          padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
          child: Visibility(
              visible: HomePageServices.data[0].tasks.length > 3,
              replacement: const SizedBox(
                height: 0,
                width: 0,
              ),
              child: Container(
                  width: 200.w,
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: TextButton(
                    child: Text("SHOW ALL", style: TextStyle(color: kConstantPurple)),
                    onPressed: () {
                      Get.to(TaskListsPageScreen());
                    },
                  ))))
    ]);
  }
}
