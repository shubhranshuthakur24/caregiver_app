import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendarScreen_widgets.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CalenderAppBar(),
      ),
      body: Container(
        height: 925.h,
        color: kConstantPaleWhite,
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 22.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// This is the calender to be used.
              SizedBox(
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(1980),
                  lastDay: DateTime(2100),
                  rowHeight: 40.h,
                  calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: kConstantPurple,
                        shape: BoxShape.circle,
                      ),
                      isTodayHighlighted: true),
                ),
              ),
              const Divider(),
              SizedBox(height: 10.h),
              Text("MARK AVAILABLITY", style: TextStyle(color: kBlueGreyTextColor, fontSize: 14.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              const AvailabilityButtons(),
              SizedBox(height: 10.h),
              Text(
                "${DateFormat("dd MMM yyyy").format(DateTime.now()).toString()}",
                style: TextStyle(color: kBlueGreyTextColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Container(
                child: SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("9:15 AM",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'TTCommons-Regular')),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "40 Mins",
                                    style: TextStyle(fontSize: 14.sp, color: Colors.black, fontFamily: 'TTCommons-Regular'),
                                  )
                                ],
                              ),
                              SizedBox(width: 12.w),
                              CircleAvatar(
                                backgroundImage: const NetworkImage(
                                    "https://media.istockphoto.com/photos/positive-mindset-positive-life-picture-id1272765753?b=1&k=20&m=1272765753&s=170667a&w=0&h=8Twyimx9TOKgr67OrabNA5sUeEgYT7ckM5HU6fnL5Ik="),
                                radius: 25.r,
                              ),
                              SizedBox(width: 12.w),
                              Card(
                                color: Colors.pink.shade100,
                                child: FittedBox(
                                  // height: 74.h,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(11.sp, 10.sp, 15.sp, 18.sp),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("John Alberson",
                                            style: TextStyle(
                                                fontSize: 18.sp, color: Colors.purple, fontFamily: 'TTCommons-DemiBold')),
                                        Text(
                                          "30 Min Initial Appointment",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12.sp, fontFamily: 'TTCommons-Regular', color: Colors.black),
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
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
