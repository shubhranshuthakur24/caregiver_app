import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/care_giver_app/screens/select_navigator%20_screen/select_navigator_screen.dart';

import '../constants.dart';

class AssessmentPagesEndScreen extends StatelessWidget {
  const AssessmentPagesEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kConstantPaleWhite,
        width: 375.w,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              // SizedBox(height: 159.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.sp,
                  right: 24.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Done!",
                      textAlign: TextAlign.left,
                      style: kConstantAssessmentBigTextColor(),
                    ),
                    Text(
                      "Thank you for your responses.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'TTCommons-Medium',
                        color: kBlueGreyTextColor,
                        fontSize: 36.sp,
                      ),
                    ),
                    Text(
                      "Let’s get you set up with your dedicated navigator.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'TTCommons-Medium',
                        color: kBlueGreyTextColor,
                        fontSize: 36.sp,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                child: MediaQuery.of(context).size.width > 750
                    ? MaterialButton(
                        elevation: 0,
                        height: 50.h,
                        minWidth: 200.w,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.sp),
                          side: BorderSide(color: kConstantPurple, width: 2.2.sp),
                        ),
                        color: kConstantPurple,
                        child: Text(
                          "GO",
                          style: kButtonTextStyle(),
                        ),
                        onPressed: () {
                          Get.to(const SelectNavigator());
                        },
                      )
                    : MaterialButton(
                        elevation: 0,
                        height: 50.h,
                        minWidth: 340.w,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                          side: BorderSide(color: kConstantPurple, width: 2.2.sp),
                        ),
                        color: kConstantPurple,
                        child: Text(
                          "GO",
                          style: kButtonTextStyle(),
                        ),
                        onPressed: () {
                          Get.to(const SelectNavigator());
                        },
                      ),
              ),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }
}
