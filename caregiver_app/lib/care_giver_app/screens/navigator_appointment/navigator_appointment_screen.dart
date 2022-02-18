import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:givershealths/care_giver_app/screens/calander/calander_popup_screen.dart';
import 'package:givershealths/care_giver_app/screens/calander/calendar_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/main_home_page.dart';
import 'package:givershealths/care_giver_app/screens/select_navigator%20_screen/select_navigator_screen.dart';

import '../constants.dart';
import 'navigator_appointment_widgets.dart';

class NavigatorAppointmentScreen extends StatefulWidget {
  const NavigatorAppointmentScreen({Key? key}) : super(key: key);

  @override
  _NavigatorAppointmentScreenState createState() => _NavigatorAppointmentScreenState();
}

class _NavigatorAppointmentScreenState extends State<NavigatorAppointmentScreen> {
  static int slotid = 0;

  _NavigatorAppointmentScreenState() {
    CalendarServices.availableSlotsBySelectedDate.clear();
    CalendarServices.totalNavAvailableSlotsData.clear();
    CalanderPopUpScreen.availableSlotDateList.clear();
    CalendarServices.selectedDate.value = "";

    CalendarServices.navid = Get.arguments[0];
    CalendarServices.navName = Get.arguments[1];
    CalendarServices.navProfileUrl = Get.arguments[2];
    CalendarServices.navAddress = Get.arguments[3];
    CalendarServices.screenNameWhereCalanderUsed = "NavigatorAppointmentScreen";
    final controller = Get.put(CalendarServices());
    CalendarServices.apiGetAvilableSlot2();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: SteelGrey,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 76.h),
                SizedBox(
                  height: 43.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 21.sp, right: 27.sp),
                    child: Text(
                      "Book Appointment",
                      style: TextStyle(
                          color: kBlueGreyTextColor, fontSize: 36.sp, fontFamily: "TTCommons-Medium", letterSpacing: -0.3.sp),
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                SizedBox(
                  height: 200.h,
                  // color: Colors.white,

                  child: Padding(
                    padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 375.w,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70.w,
                                child: NavigatorSelectorNavigatorPhoto(),
                              ),
                              SizedBox(width: 11.w, height: 80.h),
                              const NavigatorDetailsAtNavigatorSelector()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),

                        // TextButton(
                        //     onPressed: () {
                        //       CalanderPopUpScreen.selectDate(context);
                        //       // CalanderWidget.selectDate(context);
                        //     },
                        //     child: Text("Select Date"))
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //     flex: 2,
                //     child: Container(
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10.sp),
                //           backgroundBlendMode: BlendMode.softLight,
                //           color: Colors.grey[200]),
                //       child: CalendarDatePicker(
                //         initialDate: DateTime.now(),
                //         lastDate: DateTime.now(),
                //         onDateChanged: (DateTime value) {},
                //         firstDate: DateTime.now(),
                //       ),
                //     )),

                // NavigatorSelectorBookButton(CalendarServices.navid, slotid),
                Spacer(),

                Padding(
                  padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
                  child: Column(
                    children: [
                      Obx(() {
                        return CalendarServices.totalNavAvailableSlotsData.isEmpty
                            ? showSpinkitRing(color: kConstantPurple)
                            : MaterialButton(
                                elevation: 0,
                                height: 45.h,
                                minWidth: double.infinity,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.sp),
                                ),
                                color: kConstantPurple,
                                child: Text(
                                  "SELECT DATE",
                                  style: kButtonTextStyle(),
                                ),
                                onPressed: () {
                                  CalanderPopUpScreen.selectDate(context);
                                });
                      }),
                      SizedBox(height: 10.h),
                      MaterialButton(
                          elevation: 0,
                          height: 45.h,
                          minWidth: double.infinity,
                          color: kConstantPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.sp), side: BorderSide(color: kConstantPurple, width: 2.sp)),
                          child: Text(
                            "SKIP FOR NOW",
                            style: kButtonTextStyle(),
                          ),
                          onPressed: () {
                            Get.offAll(() => const MainHomePage());
                          })
                    ],
                  ),
                ),
                SizedBox(height: 36.h)
              ],
            ),
          ),
        ),
        onWillPop: () {
          Get.off(SelectNavigator());

          return Future.value(true);
        });
  }
}
