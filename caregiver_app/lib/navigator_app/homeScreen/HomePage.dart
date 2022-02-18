import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

import 'homepageWidgets.dart';

class NavigatorHomePage extends StatefulWidget {
  const NavigatorHomePage({Key? key}) : super(key: key);

  @override
  _NavigatorHomePageState createState() => _NavigatorHomePageState();
}

class _NavigatorHomePageState extends State<NavigatorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigatorDrawer(),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: const HomeScreenAppBar(),
      ),
      body: Container(
        width: 375.w,
        decoration: kConstantGradientNew(),
        child: SafeArea(
          child: Column(
            children: [
              // const MenuNotificationAndUserWidgets(),
              Container(
                padding: EdgeInsets.fromLTRB(24.sm, 30.h, 0, 0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Row Of Widgets
                      SizedBox(height: 20.h),
                      Text(
                        "CareGivers List",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12.w),
                      //Row Of CareGivers
                      SizedBox(
                        height: 120.h,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 110.h,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10.sp),
                                    child: CircleAvatar(
                                      radius: 35.r,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              CupertinoIcons.add,
                                              color: Colors.black12,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Add",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.sp, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 110.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 7,
                                  itemBuilder: (context, i) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.all(10.sp),
                                            child: CircleAvatar(
                                              backgroundImage: const NetworkImage(
                                                  "https://media.istockphoto.com/photos/positive-mindset-positive-life-picture-id1272765753?b=1&k=20&m=1272765753&s=170667a&w=0&h=8Twyimx9TOKgr67OrabNA5sUeEgYT7ckM5HU6fnL5Ik="),
                                              radius: 35.r,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Nina",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12.sp, color: Colors.white),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 31.h),

                      Text("UPCOMING APPOINTMENT",
                          style: TextStyle(
                            fontFamily: 'TTCommons-DemiBold',
                            letterSpacing: 2,
                            fontSize: 20.sp,
                            color: Colors.white,
                          )),
                      SizedBox(height: 31.h),
                      const UpComingAppointmentBlock(),
                      const AddAppointmentButton()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
