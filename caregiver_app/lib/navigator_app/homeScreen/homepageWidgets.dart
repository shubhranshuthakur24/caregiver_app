import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';

/////////////////////////////////////     Upcoming appointment tabs

class UpComingAppointmentBlock extends StatefulWidget {
  const UpComingAppointmentBlock({
    Key? key,
  }) : super(key: key);

  @override
  State<UpComingAppointmentBlock> createState() => _UpComingAppointmentBlockState();
}

class _UpComingAppointmentBlockState extends State<UpComingAppointmentBlock> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity.w,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 346.w,
              margin: EdgeInsets.only(right: 20.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("9:15 AM", style: TextStyle(fontSize: 18.sp, color: Colors.white, fontFamily: 'TTCommons-Regular')),
                      SizedBox(height: 10.h),
                      Text(
                        "40 Mins",
                        style: TextStyle(fontSize: 14.sp, fontFamily: 'TTCommons-Regular', color: Colors.white),
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
                  Container(
                    decoration: BoxDecoration(color: kConstantPaleWhite, borderRadius: BorderRadius.circular(10.sp)),
                    // padding: EdgeInsets.fromLTRB(11.sp, 10.sp, 15.sp, 18.sp),
                    height: 74.h,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(11.sp, 10.sp, 15.sp, 18.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("John Alberson",
                              style: TextStyle(fontSize: 18.sp, color: Colors.lightBlueAccent, fontFamily: 'TTCommons-DemiBold')),
                          Text(
                            "30 Mins Initial Appointment",
                            style: TextStyle(fontSize: 16.sp, fontFamily: 'TTCommons-Regular', color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
/////////////////////////////////////////////// app bar  ///////////////////////

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 20.sp),
          child: Container(
              height: 50.h,
              width: 50.w,
              // padding: EdgeInsets.symmetric(horizontal: 5.sp),
              // margin: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 3.sp,
                ),
              ]),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu_sharp,
                  color: Colors.black,
                ),
              )),
        ),
        const Spacer(),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 3.sp,
            ),
          ]),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                    radius: 13.r,
                    backgroundColor: Colors.amberAccent,
                    child: SizedBox(
                        child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "21",
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                    ))),
              ),
              Center(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.bell,
                      color: Colors.grey,
                      size: 25.sm,
                    )),
              ),
            ],
          ),
        ),
        SizedBox(width: 24.sp),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://media.istockphoto.com/photos/positive-mindset-positive-life-picture-id1272765753?b=1&k=20&m=1272765753&s=170667a&w=0&h=8Twyimx9TOKgr67OrabNA5sUeEgYT7ckM5HU6fnL5Ik=")),
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 3.r, spreadRadius: 3.r),
              ]),
        ),
        SizedBox(width: 24.sp),
      ],
    );
  }
}

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.sp, left: 12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.sp),
                child: Text(
                  "My Navigators",
                  style: TextStyle(fontSize: 26.sp, fontFamily: "TTCommons-DemiBold"),
                ),
              ),
              SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.sp),
                            child: Row(
                              children: [
                                CircleAvatar(radius: 35.r, backgroundColor: Colors.black12),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text("Name Of Navigator"),
                                    Text('Place Of Living'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.black12,
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.add,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "ADD MORE",
                    style: TextStyle(fontSize: 22.sp, color: Colors.black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////     Add Appointment Button

class AddAppointmentButton extends StatelessWidget {
  const AddAppointmentButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeOfDay timeNow = TimeOfDay.now();

    return Container(
      padding: EdgeInsets.only(top: 15.sp, right: 24.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    contentPadding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 6.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                'Add Task',
                                style: TextStyle(fontSize: 28.sp, color: kBlueGreyTextColor),
                              ),
                            ),
                            SizedBox(height: 18.h),
                            SizedBox(
                              child: Text(
                                'TASK',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: kBlueGreyTextColor),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            TextFormField(
                              cursorColor: kConstantPurple,
                              maxLength: 20,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide(color: kConstantPurple, width: 2.sp)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kConstantPurple, width: 2.sp))),
                            ),
                            SizedBox(height: 28.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "DEADLINE",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: kBlueGreyTextColor),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Container(
                                width: double.infinity,
                                height: 40.h,
                                decoration: BoxDecoration(border: Border.all(color: kConstantGrey)),
                                child: Center(child: Text("${timeNow}"))),
                          ],
                        ),
                      ),
                      SizedBox(height: 28.h),
                      PurpleButton(
                          text: "ADD",
                          press: () {
                            Navigator.pop(context);
                          }),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              CupertinoIcons.add_circled_solid,
              // size: 25.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
