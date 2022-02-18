import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/shedule/schedule.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/navigator_screen/navigator_screen.dart';
import 'package:intl/intl.dart';

import '../../../../../constants.dart';
import '../../cancel_meeting/cancel_dialog_widget.dart';
import '../home_page_services.dart';

class NavigatorCardWidgetSheduleMeetingNew extends StatelessWidget {
  const NavigatorCardWidgetSheduleMeetingNew(
      {required this.name, required this.city, required this.state, required this.navigatorid, required this.navProileUrl});

  final String name;
  final String city;
  final String state;
  final int navigatorid;

  final String navProileUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 7.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MY NAVIGATOR",
              style: TextStyle(
                  fontSize: 13.sp,
                  letterSpacing: 0.7.sp,
                  fontFamily: 'TTCommons-Bold',
                  color: kBottomBarIcons,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(navProileUrl),
                    radius: 26.r,
                  ),
                  onTap: () {
                    Get.to(const NavigatorScreen(), arguments: [navigatorid]);
                  },
                ),
                SizedBox(width: 10.w),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(const NavigatorScreen(), arguments: [navigatorid]);
                        },
                        child: Text(
                          name.toString(),
                          style: TextStyle(
                              color: kConstantPurple,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'TTCommons-DemiBold'),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        city.toString() + ", " + state.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'TTCommons-ExtraLight'),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 3.h,
                        ),
                        child: const ScheduleButton(),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 95.w,
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     top: 3.h,
                //   ),
                //   child: const ScheduleButton(),
                // ),
                SizedBox(width: 9.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CancelResheduleMeetingNavigatorCardWidget extends StatelessWidget {
  const CancelResheduleMeetingNavigatorCardWidget(
      {required this.name, required this.city, required this.state, required this.navigatorid, required this.navProileUrl});

  final String name;
  final String city;
  final String state;
  final int navigatorid;

  final String navProileUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 133.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.sp, top: 7.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MY NAVIGATOR",
              style: TextStyle(fontSize: 14.sp, letterSpacing: 0.7.sp, fontFamily: 'TTCommons-Bold', color: kBottomBarIcons),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(navProileUrl),
                      radius: 26.r,
                    ),
                    onTap: () {
                      Get.to(const NavigatorScreen(), arguments: [navigatorid]);
                    },
                  ),
                  SizedBox(width: 18.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(const NavigatorScreen(), arguments: [navigatorid]);
                        },
                        child: Text(
                          name.toString(),
                          style: TextStyle(
                              color: kConstantPurple,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'TTCommons-DemiBold'),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        city.toString() + ", " + state.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'TTCommons-ExtraLight'),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        HomePageServices.data[0].navigatorData.meetingTypeName +
                            " meeting scheduled on " +
                            DateFormat('yMMMd').format(DateTime.parse(HomePageServices.data[0].navigatorData.date)),
                        style: TextStyle(color: Colors.black, fontSize: 11.sp, fontFamily: 'TTCommons-ExtraLight'),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              CancelDialogWidget(
                                  context: context, title: "Are you sure you want to cancel this meeting?", ActionName: "Cancel");
                              // showDialog(
                              //     context: context,
                              //     builder: (_) => SimpleDialog(
                              //           insetPadding: EdgeInsets.all(50.sp),
                              //           title: Text('Are you sure you want to cancel this meeting?'),
                              //           children: [
                              //             Row(
                              //               children: [
                              //                 DialogButton(
                              //                   text: "YES",
                              //                   onTap: () {
                              //                     Navigator.pop(context);
                              //                     showDialog(context: context, builder: (_) => ReasonDialog());
                              //                   },
                              //                 ),
                              //                 DialogButton(
                              //                   text: "NO",
                              //                   onTap: () {
                              //                     Navigator.pop(context);
                              //                   },
                              //                 ),
                              //               ],
                              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //             )
                              //           ],
                              //         ));
                            },
                            child: Container(
                              height: 23.h,
                              width: 95.w,
                              decoration: BoxDecoration(border: Border.all(color: kConstantPurple, width: 1.w)),
                              child: Center(child: Text("Cancel", style: TextStyle(color: kConstantPurple))),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              CancelDialogWidget(
                                  context: context,
                                  title: "The previous booked meeting will be canceled before you can reschedule the meeting.",
                                  ActionName: "Reschedule");
                            },
                            child: Container(
                              height: 23.h,
                              width: 95.w,
                              decoration: BoxDecoration(border: Border.all(color: kConstantPurple, width: 1.w)),
                              child: Center(child: Text("Reschedule", style: TextStyle(color: kConstantPurple))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  // SizedBox(width: 13.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
