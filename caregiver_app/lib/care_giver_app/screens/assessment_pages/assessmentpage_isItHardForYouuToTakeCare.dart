import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../constants.dart';
import 'assessment_buttons.dart';
import 'assessment_pages_services.dart';
import 'assessmentpage_yourFinancialSituation.dart';

class AssessmentPage17 extends StatefulWidget {
  const AssessmentPage17({Key? key}) : super(key: key);

  @override
  _AssessmentPage1State createState() => _AssessmentPage1State();
}

class _AssessmentPage1State extends State<AssessmentPage17> {
  AssessmentPagesSerivces controllerAssessmentPageServices = Get.find();
  int _selectedIndex = -1;
  List<String> answerList = [
    "Never",
    "Sometimes",
    "Often",
    "Unknown / NA",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstantPaleWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              child: AssessmentQuestions(
                text: "Is it hard to help the person you're caring for with daily activities?",
              ),
            ),
            SizedBox(height: 48.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.sp,
                  right: 24.sp,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 45.h,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: kConstantAssessmentButtonBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                            ),
                            side: BorderSide(width: 2.sp, color: _selectedIndex == index ? kConstantPurple : Colors.black12),
                          ),
                          child: Text(
                            answerList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _selectedIndex == index ? kConstantPurple : Colors.black,
                                fontWeight: _selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
                                fontSize: 16.sp),
                          )),
                    );

                    // return Container(
                    //   width: 330.w,
                    //   margin: EdgeInsets.only(bottom: 12.sp),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: _selectedIndex == index ? kConstantPurple : Colors.black12,
                    //       width: 1.8.w,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(50.sp)),
                    //   ),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         _selectedIndex = index;
                    //       });
                    //     },
                    //     child: Text(
                    //       answerList[index],
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //           color: _selectedIndex == index ? kConstantPurple : Colors.black,
                    //           fontWeight: _selectedIndex == index ? FontWeight.w600 : FontWeight.w400,
                    //           fontSize: 16.sp),
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Container(color: kConstantPurple, height: 5.h, width: 272.w),
                Container(color: formLandingColor4, height: 5.h, width: 103.w),
                Expanded(child: Container(color: formLandingColor4, height: 5.h))
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            ExitBackAndNextButtonsList(
                next: () {
                  if (_selectedIndex != -1) {
                    controllerAssessmentPageServices.submitAns(15, _selectedIndex);
                  }

                  Get.to(const AssessmentPage18());
                },
                apiName: availableApiName.SaveAssessment),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
}
