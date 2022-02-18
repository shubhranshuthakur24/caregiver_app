import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../constants.dart';
import 'assessment_form_user_details/assessment_form_user_details_screen.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstantPaleWhite,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120.h),
                  Text(
                    "Thank You for Creating Your Account!",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w500,
                      color: kConstantGrey,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "We will be setting you up with a dedicated navigator and resources to support you.",
                    style: ToolkitHeaderLarge(),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "We will need to ask some questions about you and your loved one before we can identify the best navigator and resources.",
                    style: ToolkitHeaderLarge(),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                      "The questions should take around 5 minutes to complete.",
                      style: TextStyle(
                        fontFamily: 'TTCommons-Regular',
                        color: kConstantGrey,
                        fontSize: 24.sp,
                        letterSpacing: -.3.sp,
                      ))
                ],
              ),
              const Spacer(),
              Container(
                child: MediaQuery.of(context).size.width > 750
                    ? Container(
                        width: 250.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: kConstantPurple,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.sp),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.to(const AssessmentFormUserDetailsScreen());
                          },
                          child: Text(
                            "START NOW",
                            style: kButtonTextStyle(),
                          ),
                        ),
                      )
                    : Container(
                        width: 327.w,
                        decoration: BoxDecoration(
                          color: kConstantPurple,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.sp),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.to(const AssessmentFormUserDetailsScreen());
                          },
                          child: Text(
                            "START NOW",
                            style: kButtonTextStyle(),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 36.h)
            ],
          ),
        ),
      ),
    );
  }
}
