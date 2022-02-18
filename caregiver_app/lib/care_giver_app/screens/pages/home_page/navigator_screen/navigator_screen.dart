import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/message_room_caregiver_to_navigator_screen.dart';
import 'package:givershealths/test.dart';

import '../../../constants.dart';
import 'navigator_screen_constants.dart';
import 'navigator_screen_services.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  late NavigatorScreenServices _navigatorScreenServicesController;

  @override
  void initState() {
    // TODO: implement initState
    NavigatorScreenServices.navId = Get.arguments[0];
    _navigatorScreenServicesController = Get.put(NavigatorScreenServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstantBlue,
      drawerScrimColor: kConstantBlue,
      body: Container(
        color: const Color(0xFFfaf9f7),
        height: double.infinity,
        width: 375.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: kConstantBlue,
                child: Padding(
                  padding: EdgeInsets.only(top: 234.h),
                  child: Stack(
                    children: [
                      Container(
                        height: 212.h,
                        width: 375.w,
                        color: kConstantBlue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      // Get.to(TestPage());
                                      Navigator.pop(context);
                                    },
                                    padding: const EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: const [
                                        Icon(
                                          CupertinoIcons.back,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Back",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "My Navigator",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 14.w),
                          Align(
                            heightFactor: 1.5,
                            alignment: Alignment(-.84.sp, 2.5.sp),
                            child: Obx(() {
                              return _navigatorScreenServicesController.data.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 10.h, left: 50.w),
                                      child: showSpinkitRing(),
                                    )
                                  : navigatorPhotoCircle(_navigatorScreenServicesController.data[0].profilePicUrl);
                            }),
                          ),
                          SizedBox(width: 15.w),
                          Obx(() {
                            return _navigatorScreenServicesController.data.isEmpty
                                ? SizedBox(
                                    height: 200.h,
                                    child: Container(),
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 150.h),
                                      Text(
                                        _navigatorScreenServicesController.data[0].firstName +
                                            " " +
                                            _navigatorScreenServicesController.data[0].lastName,
                                        style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        _navigatorScreenServicesController.data[0].city +
                                            " " +
                                            _navigatorScreenServicesController.data[0].state,
                                        style: locationTextStyle(),
                                      )
                                    ],
                                  );
                          })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Obx(() {
                return _navigatorScreenServicesController.data.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: 100.h),
                        child: showSpinkitRing(color: kConstantPurple),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 24.h, right: 24.h),
                        child: Column(
                          children: [
                            Text(
                              _navigatorScreenServicesController.data[0].bio,
                              style: navigatorBioStyleText(),
                            ),
                            SizedBox(height: 28.h),
                            SizedBox(
                              height: 158.h,
                              width: 327.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.sp),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.sp, top: 16.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Appointment",
                                        style: TextStyle(color: kConstantPurple, fontSize: 18.sp, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "No upcoming appointment",
                                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                                      ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     CalanderPopUpScreen.selectDate(
                                      //         context);
                                      //   },
                                      //   child: Container(
                                      //     width: 295.w,
                                      //     height: 38.h,
                                      //     decoration: BoxDecoration(
                                      //       border: Border.all(
                                      //         color: kConstantPurple,
                                      //         width: 2.sp,
                                      //       ),
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(100.sp)),
                                      //     ),
                                      //     child: Center(
                                      //       child: Text(
                                      //         "Schedule",
                                      //         style:
                                      //             navigatorCardButtonsTextStyle(),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 28.h),
                            SizedBox(
                              height: 158.h,
                              width: 327.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.sp),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Contact",
                                        style: TextStyle(color: kConstantPurple, fontSize: 18.sp, fontWeight: FontWeight.w600),
                                      ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     UrlLauncher.launchURL(_navigatorScreenServicesController.data[0].phone.toString());
                                      //   },
                                      //   child: Container(
                                      //     width: 295.w,
                                      //     height: 38.h,
                                      //     decoration: BoxDecoration(
                                      //       border: Border.all(
                                      //         color: kConstantPurple,
                                      //         width: 2.sp,
                                      //       ),
                                      //       borderRadius: BorderRadius.all(Radius.circular(100.sp)),
                                      //     ),
                                      //     child: Row(
                                      //       mainAxisAlignment: MainAxisAlignment.center,
                                      //       children: [
                                      //         const Icon(
                                      //           Icons.call,
                                      //           color: kConstantPurple,
                                      //         ),
                                      //         Text(
                                      //           _navigatorScreenServicesController.data[0].phone,
                                      //           style: navigatorCardButtonsTextStyle(),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => const MessageRoomCareGiverToNavigator());
                                        },
                                        child: Container(
                                          width: 295.w,
                                          height: 38.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kConstantPurple,
                                              width: 2.sp,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(100.sp)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Chat",
                                              style: navigatorCardButtonsTextStyle(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
