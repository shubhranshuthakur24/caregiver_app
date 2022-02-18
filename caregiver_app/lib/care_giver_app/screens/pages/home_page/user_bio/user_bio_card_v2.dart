import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/SRC/string_manipulation_function/string_manipulation.dart';

import '../../../constants.dart';

class UserBioCardV2 extends StatefulWidget {
  String tittle;
  String profile;
  String body;
  String name;

  UserBioCardV2({required this.tittle, required this.profile, required this.body, required this.name});

  @override
  _UserBioCardV2State createState() => _UserBioCardV2State();
}

class _UserBioCardV2State extends State<UserBioCardV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 155.w,
        height: 195.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 3.sp, offset: Offset(0, 5.sp)),
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 17.h,
            ),
            Text(
              widget.tittle,
              style: TextStyle(
                  color: kConstantUserProfileTextGreyColor, fontFamily: 'TTCommons-Bold', fontSize: 14.sp, letterSpacing: 0.7.sp),
            ),
            SizedBox(
              height: 13.h,
            ),
            widget.tittle == "MY NAVIGATOR"
                ? widget.profile.toString().isEmpty
                    ? nameImage(name: widget.name, width: 80, height: 80)
                    : CircleAvatar(
                        backgroundImage: NetworkImage(widget.profile.toString()),
                        radius: 40.sp,
                      )
                : Obx(() {
                    return lovedOneProfileUrlUniversal.value.isEmpty
                        ? nameImage(name: widget.name, height: 80, width: 80)
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                              lovedOneProfileUrlUniversal.value,
                            ),
                            radius: 40.sp,
                          );
                  }),
            SizedBox(
              height: 11.h,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 13.w, right: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: kConstantUserProfileTextGreyColor,
                        fontFamily: 'TTCommons-Bold',
                        fontSize: 14.sp,
                        letterSpacing: 0.7.sp),
                  ),
                  Text(
                    StringManipulation.trimText(string: widget.body, StringLength: 15),
                    style: TextStyle(
                        color: kConstantUserProfileTextGreyColor,
                        fontFamily: 'TTCommons-Medium',
                        fontSize: 14.sp,
                        letterSpacing: 0.7.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
