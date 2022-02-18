import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/SRC/internationalization_using_getx/language_file.dart';

import '../constants.dart';
import 'assessment_buttons.dart';
import 'assessmentpage_emergencyRoom_numberOfTimes.dart';

class AssessmentPage2 extends StatefulWidget {
  const AssessmentPage2({Key? key}) : super(key: key);

  @override
  _AssessmentPage2State createState() => _AssessmentPage2State();
}

class _AssessmentPage2State extends State<AssessmentPage2> {
  final List _selectedList = [];
  List<String> answerList = [
    LanguageFile.function1()["Diabetes"].toString(),
    LanguageFile.function1()["Heart Disease"].toString(),
    LanguageFile.function1()["COPD"].toString(),
    LanguageFile.function1()["Cancer"].toString(),
    LanguageFile.function1()["Stroke"].toString(),
    LanguageFile.function1()["Kidney Disease"].toString(),
    LanguageFile.function1()["Dementia or Alzheimer's"].toString(),
    LanguageFile.function1()["Mild cognitive impairment"].toString(),
    LanguageFile.function1()["Depression"].toString(),
    LanguageFile.function1()["Hospital admission within the last year"].toString(),
    LanguageFile.function1()["Other serious physical health condition"].toString(),
    LanguageFile.function1()["Other serious mental health condition"].toString()
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
                text: "Is your loved one diagnosed with any of the following?",
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
                  itemCount: answerList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 45.h,
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              if (_selectedList.contains(index)) {
                                _selectedList.remove(index);
                              } else {
                                _selectedList.add(index);
                              }
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.sp),
                            ),
                            side:
                                BorderSide(width: 2.sp, color: _selectedList.contains(index) ? kConstantPurple : Colors.black12),
                          ),
                          child: Text(answerList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _selectedList == index ? kConstantPurple : Colors.black,
                                  fontWeight: _selectedList == index ? FontWeight.w600 : FontWeight.w400,
                                  fontSize: 16.sp))),
                    );
                    //   Container(
                    //   width: 330.w,
                    //   margin: EdgeInsets.only(bottom: 12.sp),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: _selectedList.contains(index) ? kConstantPurple : Colors.black12,
                    //       width: 2.w,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(50.sp)),
                    //   ),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         if (_selectedList.contains(index)) {
                    //           _selectedList.remove(index);
                    //         } else {
                    //           _selectedList.add(index);
                    //         }
                    //       });
                    //     },
                    //     child: Text(answerList[index],
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //             color: _selectedList == index ? kConstantPurple : Colors.black,
                    //             fontWeight: _selectedList == index ? FontWeight.w600 : FontWeight.w400,
                    //             fontSize: 16.sp)),
                    //   ),
                    // );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Container(color: kConstantPurple, height: 5.h, width: 60.w),
                Container(color: formLandingColor4, height: 5.h, width: 315.w)
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            ExitBackAndNextButtonsList(next: () {
              Get.to(const AssessmentPage3());
            },apiName: availableApiName.SaveAssessment),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
}
