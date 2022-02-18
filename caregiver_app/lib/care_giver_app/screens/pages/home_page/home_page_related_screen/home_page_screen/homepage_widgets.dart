import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/create_update_task/create_task_update_task_bottom_sheet.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/create_update_task/create_update_task_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/notification/notification_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/shedule/schedule.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/navigator_screen/navigator_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_services.dart';

import '../../../../constants.dart';
import 'home_page_services.dart';

class UserImageWidget extends StatelessWidget {
  String? userProfileUrl;

  UserImageWidget([this.userProfileUrl]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UserBioServices.apiGetCgProfile();
      },
      child: Obx(() {
        return userProfileUrlUniversal.value.isEmpty
            ? nameImage(name: HomePageServices.data[0].cgFirstName, TextSize: 25, width: 45, height: 45)
            : CircleAvatar(
                radius: 23.r,
                backgroundImage: NetworkImage(userProfileUrlUniversal.toString()),
              );
      }),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => NotificationScreen(), transition: Transition.upToDown, duration: const Duration(milliseconds: 600));
      },
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(
            child: Icon(
          CupertinoIcons.bell,
          color: Colors.black,
          size: 24.r,
        )),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 25.r,
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          iconSize: 30.sp,
        ),
      ),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.lightBlueAccent,
          width: 1.5.w,
        ),
      ),
    );
  }
}

// class NavigatorCardWidget extends StatelessWidget {
//   const NavigatorCardWidget(
//       {required this.name, required this.city, required this.state, required this.navigatorid, required this.navProileUrl});
//
//   final String name;
//   final String city;
//   final String state;
//   final int navigatorid;
//
//   final String navProileUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 96.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: ShadowColor),
//         borderRadius: BorderRadius.all(
//           Radius.circular(10.sp),
//         ),
//         // boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 0.5.sp)],
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(left: 8.sp, top: 15.sp, bottom: 10.sp),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(
//             //   "MY NAVIGATOR",
//             //   style: TextStyle(
//             //       fontSize: 14.sp,
//             //       letterSpacing: 0.7.sp,
//             //       fontFamily: 'TTCommons-Bold',
//             //       color: kBottomBarIcons),
//             // ),
//             // SizedBox(height: 10.h),
//             Expanded(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // SizedBox(width: 12.h),
//
//                   ///
//                   ///Gesture Detector Here , so you can add the person here.
//                   ///
//                   GestureDetector(
//                     child: CircleAvatar(
//                       // backgroundImage: const AssetImage("images/navigator.png"),
//                       backgroundImage: NetworkImage(navProileUrl),
//                       radius: 26.r,
//                     ),
//                     onTap: () {
//                       Get.to(const NavigatorScreen(), arguments: [navigatorid]);
//                       // ApiFile.apiGetNavProfile(TokenServices.token, navigatorid);
//                     },
//                   ),
//                   SizedBox(width: 12.w),
//
//                   Padding(
//                     padding: EdgeInsets.only(top: 3.h),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ///
//                         ///Gesture Detector Here , so you can add the person here.
//                         ///
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const NavigatorScreen(), arguments: [navigatorid]);
//                             // ApiFile.apiGetNavProfile(TokenServices.token, navigatorid);
//                             // Get.to(const NavigatorScreen());
//                           },
//                           child: Text(
//                             name.toString(),
//                             style: TextStyle(
//                                 color: kConstantPurple,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w600,
//                                 fontFamily: 'TTCommons-DemiBold'),
//                           ),
//                         ),
//                         Container(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(HomePageServices.data[0].navigatorData.meetingTypeName),
//                                   Icon(
//                                     Icons.circle,
//                                     size: 5.sp,
//                                   ),
//                                   Text(" Cancelled"),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     CupertinoIcons.video_camera_solid,
//                                     color: Colors.grey,
//                                   ),
//                                   Text(HomePageServices.data[0].navigatorData.slotStartTime + " PST"),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         // Text(
//                         //   city.toString() + " " + state.toString(),
//                         //   style: TextStyle(
//                         //       color: Colors.black,
//                         //       fontSize: 12.sp,
//                         //       fontFamily: 'TTCommons-ExtraLight'),
//                         // )
//                       ],
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     constraints: BoxConstraints(maxHeight: 60.h, maxWidth: 40.w),
//                     width: 50.w,
//                     decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(2.sp)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           HomePageServices.meetingMonth,
//                           style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w400),
//                         ),
//                         Text(
//                           HomePageServices.meetingDay,
//                           style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print("Menu opened");
//                       showDialog(
//                           context: context,
//                           builder: (_) => SimpleDialog(
//                                 insetPadding: EdgeInsets.all(50.sp),
//                                 title: Text('Are you sure you want to cancel this meeting?'),
//                                 children: [
//                                   Row(
//                                     children: [
//                                       DialogButton(
//                                         text: "YES",
//                                         onTap: () {
//                                           Navigator.pop(context);
//                                           showDialog(context: context, builder: (_) => MeetingCancelReasonDialog());
//                                         },
//                                       ),
//                                       DialogButton(
//                                         text: "NO",
//                                         onTap: () {
//                                           Navigator.pop(context);
//                                         },
//                                       ),
//                                     ],
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   )
//                                 ],
//                               ));
//                     },
//                     child: Icon(Icons.more_vert),
//                   )
//                   // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
//
//                   // Padding(
//                   //   padding: EdgeInsets.only(
//                   //     top: 3.h,
//                   //   ),
//                   //   child: const ScheduleButton(),
//                   // ),
//                   // SizedBox(width: 13.w),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class NavigatorCardWidgetSheduleMeeting extends StatelessWidget {
  const NavigatorCardWidgetSheduleMeeting(
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
      height: 96.h,
      // width: MediaQuery.of(context).size.width - 10,
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
                  SizedBox(width: 14.w),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
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
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'TTCommons-DemiBold'),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          city.toString() + " " + state.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'TTCommons-ExtraLight'),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 8.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                    ),
                    child: const ScheduleButton(),
                  ),
                  SizedBox(width: 13.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTaskRowWithButton extends StatefulWidget {
  const MyTaskRowWithButton({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTaskRowWithButton> createState() => _MyTaskRowWithButtonState();
}

class _MyTaskRowWithButtonState extends State<MyTaskRowWithButton> {
  var selectedDate1 = DateTime.now().obs;
  CreateUpdateTaskServices _createTaskServices = Get.put(CreateUpdateTaskServices());

  @override
  Widget build(BuildContext context) {
    bool selected = false;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "MY TASKS",
            style: TextStyle(
              letterSpacing: 0.7.sp,
              fontSize: 13.sp,
              color: kBlueGreyTextColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'TTCommons-Bold',
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Get.delete<CreateUpdateTaskServices>();
                showBottomSheet(
                  context: context,
                  builder: (builder) => CreateTaskUpdateBottomSheetContainer(
                    ActionName: "Add",
                  ),
                );
              },
              child: Icon(
                CupertinoIcons.add_circled_solid,
                color: kConstantPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: kConstantPurple),
      ),
      onPressed: onTap,
      // onPressed: () {
      //   Navigator.pop(context);
      //   showDialog(context: context, builder: (_) => ReasonDialog());
      // },
    );
  }
}
