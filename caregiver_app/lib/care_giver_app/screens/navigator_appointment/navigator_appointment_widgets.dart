import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/calander/calendar_services.dart';

import '../constants.dart';

///                             Widgets in here
///     1. DateButtons
///     2.Date and Day (To be used inside dateButtons)
///     3.DateBarScroller (Uses widget 1 & 2 )
///     4.NavigatorSelectorNavigatorPhoto
///     5.NavigatorSelectorBookButton
///     6.NavigatorDetailsAtNavigatorSelector

class DateButtons extends StatelessWidget {
  const DateButtons({Key? key, required this.time, required this.pressed}) : super(key: key);

  final String time;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: 90.w,
      height: 45.h,
      splashColor: kConstantPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.sp),
        side: BorderSide(color: kConstantPurple, width: 2.sp),
      ),
      child: Text(
        time,
        style: TextStyle(
          fontFamily: 'TTCommons-Medium',
          color: kConstantPurple,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.8.sp,
          fontSize: 18.sp,
        ),
      ),
      onPressed: pressed,
    );
  }
}

class AppointmentDatesAndButtons extends StatelessWidget {
  const AppointmentDatesAndButtons({Key? key, required this.dayAndDate, required this.pressed, required this.time})
      : super(key: key);
  final String dayAndDate;
  final String time;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 10.h),
          Text(
            // add day and date here
            dayAndDate,
            style: TextStyle(fontSize: 16.sp, fontFamily: 'TTCommons-Regular', color: kBlueGreyTextColor),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 45.h,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, builder) {
                  return Row(children: [
                    (MaterialButton(
                        elevation: 0,
                        height: 45.h,
                        splashColor: kConstantPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.sp), side: BorderSide(color: kConstantPurple, width: 2.sp)),
                        child: Text(time,
                            style: TextStyle(
                                fontFamily: 'TTCommons-Medium',
                                color: kConstantPurple,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.8.sp,
                                fontSize: 18.sp)),
                        onPressed: pressed)),
                    SizedBox(width: 5.w)
                  ]);
                }),
          )
        ]));
  }
}

class NavigatorSelectorNavigatorPhoto extends StatelessWidget {
  const NavigatorSelectorNavigatorPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 70.h,
          width: 70.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                CalendarServices.navProfileUrl.toString(),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 25.h,
            width: 25.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Icon(
              Icons.check,
              size: 18.sp,
              color: Colors.lightGreenAccent,
            ),
          ),
        ),
      ],
    );
  }
}

class NavigatorSelectorBookButton extends StatelessWidget {
  int navid;
  int slotid;

  NavigatorSelectorBookButton(this.navid, this.slotid);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.only(left: 21.sp, right: 27.sp),
        child: MaterialButton(
            elevation: 0,
            minWidth: double.infinity,
            splashColor: kConstantPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.sp),
              side: BorderSide(color: kConstantPurple, width: 2.2.sp),
            ),
            color: kConstantPurple,
            child: Text(
              "BOOK",
              style: kButtonTextStyle(),
            ),
            onPressed: () {
              CalendarServices.apiBookSlot(TokenServices.token, navid, 01, slotid, 01);
            }),
      ),
    );
  }
}

class NavigatorDetailsAtNavigatorSelector extends StatelessWidget {
  const NavigatorDetailsAtNavigatorSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("MY NAVIGATOR",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, letterSpacing: 0.7.sp, color: kBlueGreyTextColor, fontFamily: "TTCommons-Bold")),
        SizedBox(height: 8.h),
        Text(CalendarServices.navName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: kBlueGreyTextColor, fontFamily: "TTCommons-Medium")),
        SizedBox(height: 2.h),
        Text(CalendarServices.navAddress,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11.sp, color: kBlueGreyTextColor, fontFamily: "TTCommons-Regular"))
      ],
    );
  }
}
