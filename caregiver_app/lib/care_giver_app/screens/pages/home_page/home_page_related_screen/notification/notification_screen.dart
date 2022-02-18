import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/notification/notification_services.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationServices _notificationServices = Get.put(NotificationServices());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Notification",
            style: TextStyle(color: kBlueGreyTextColor, fontSize: 20.sp),
          ),
          backgroundColor: bootomNavBarBackgroundColor,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  CupertinoIcons.xmark,
                  color: kBlueGreyTextColor,
                  size: 22.0.r,
                ),
              ),
            )
          ],
          elevation: 0.4,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          color: kConstantPaleWhite,
          child: Obx(() {
            return _notificationServices.LoadApiGetTaskList.value == false
                ? Center(
                    child: showSpinkitRing(color: kConstantPurple),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      // Container(
                      //   height: 30.h,
                      //   color: Colors.grey.shade300,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Spacer(),
                      //       Text("Notification",
                      //           style: TextStyle(fontSize: 20.sp, fontFamily: 'TTCommons-Bold', color: kBlueGreyTextColor)),
                      //       SizedBox(
                      //         width: 5.w,
                      //       ),
                      //       SizedBox(
                      //         width: 5.w,
                      //       ),
                      //       Spacer(),
                      //       InkWell(
                      //         onTap: () {
                      //           Get.back();
                      //         },
                      //         child: Icon(
                      //           // Icons.cancel,
                      //           CupertinoIcons.xmark,
                      //           color: kBlueGreyTextColor,
                      //           size: 22.0.r,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        child: ListView.builder(
                            // padding: const EdgeInsets.all(8),
                            itemCount: _notificationServices.notificationList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10.w, left: 10.w),
                                // color: Colors.white,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Divider(
                                      //   height: 1.h,
                                      //   color: Colors.black26,
                                      // ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 12.w,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(
                                            //   height: 10.h,
                                            // ),
                                            Text(
                                              _notificationServices.notificationList[index].title,
                                              style:
                                                  TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: "TTCommons-Regular"),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              _notificationServices.notificationList[index].body,
                                              style: TextStyle(
                                                  color: Colors.black54, fontSize: 10.sp, fontFamily: "TTCommons-Regular"),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Text(
                                              _notificationServices.notificationList[index].daysOld.toString() + " days ago",
                                              style: TextStyle(
                                                  color: Colors.black54, fontSize: 10.sp, fontFamily: "TTCommons-Regular"),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Divider(
                                              height: 1.h,
                                              color: Colors.black26,
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(
                                        height: 14.h,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
