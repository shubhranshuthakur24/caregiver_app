import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../constants.dart';
import 'assessment_buttons.dart';
import 'assessment_pages_services.dart';
import 'assessmentpage_longtermCare_insurance.dart';

class AssessmentPage7 extends StatefulWidget {
  const AssessmentPage7({Key? key}) : super(key: key);

  @override
  _AssessmentPage1State createState() => _AssessmentPage1State();
}

class _AssessmentPage1State extends State<AssessmentPage7> {
  AssessmentPagesSerivces controllerAssessmentPageServices = Get.find();
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = -1;
  bool selected = false;
  bool isVisible = false;
  List<String> answerList = [
    "Yes",
    "No",
    "I Don't Know",
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
                text: "Does your loved one have private health insurance?(e.g., UnitedHealthcare, Anthem, Blues, etc.)",
              ),
            ),
            SizedBox(height: 48.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.sp,
                  right: 24.sp,
                ),
                child: ListView(
                  children: [
                    Container(
                      height: 45.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;

                              _selectedIndex = 1;
                              selected = !selected;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: kConstantAssessmentButtonBackgroundColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(assessmentButtonBorderRadius)),
                              side: BorderSide(width: 2.sp, color: _selectedIndex == 1 ? kConstantPurple : Colors.black12)),
                          child: Text(
                            answerList.elementAt(0),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _selectedIndex == 1 ? kConstantPurple : Colors.black,
                                fontWeight: _selectedIndex == 1 ? FontWeight.w600 : FontWeight.w400,
                                fontSize: 16.sp),
                          )),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                          child: TextField(
                            controller: _textEditingController,
                            cursorColor: kConstantPurple,
                            autofocus: true,
                            decoration: InputDecoration(
                                hintText: "Please Specify",
                                hintStyle: TextStyle(color: Colors.blueGrey.shade200, fontWeight: FontWeight.w600),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderSide: BorderSide(color: kConstantPurple, width: 2.sp)),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kConstantPurple, width: 2.sp)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kConstantPurple, width: 2.sp))),
                          ),
                          visible: isVisible),
                    ),
                    Container(
                      height: 45.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isVisible = false;
                              _selectedIndex = 2;
                              // isVisible = !isVisible;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: kConstantAssessmentButtonBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                              ),
                              side: BorderSide(width: 2.sp, color: _selectedIndex == 2 ? kConstantPurple : Colors.black12)),
                          child: Text(
                            answerList.elementAt(1),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _selectedIndex == 2 ? kConstantPurple : Colors.black,
                                fontWeight: _selectedIndex == 2 ? FontWeight.w600 : FontWeight.w400,
                                fontSize: 16.sp),
                          )),
                    ),
                    Container(
                      height: 45.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isVisible = false;
                              _selectedIndex = 3;
                              selected = !selected;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: kConstantAssessmentButtonBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                              ),
                              side: BorderSide(width: 2.sp, color: _selectedIndex == 3 ? kConstantPurple : Colors.black12)),
                          child: Text(
                            answerList.elementAt(2),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: _selectedIndex == 3 ? kConstantPurple : Colors.black,
                                fontWeight: _selectedIndex == 3 ? FontWeight.w600 : FontWeight.w400,
                                fontSize: 16.sp),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       left: 24.sp,
            //       right: 24.sp,
            //     ),
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       itemCount: 3,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           height: 45.h,
            //           margin: EdgeInsets.symmetric(vertical: 5.sp),
            //           child: OutlinedButton(
            //               onPressed: () {
            //                 setState(() {
            //                   _selectedIndex = index;
            //                 });
            //               },
            //               style: OutlinedButton.styleFrom(
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(50.sp),
            //                 ),
            //                 side: BorderSide(
            //                     width: 2.sp,
            //                     color: _selectedIndex == index
            //                         ? kConstantPurple
            //                         : Colors.black12),
            //               ),
            //               child: Text(
            //                 answerList[index],
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                     color: _selectedIndex == index
            //                         ? kConstantPurple
            //                         : Colors.black,
            //                     fontWeight: _selectedIndex == index
            //                         ? FontWeight.w600
            //                         : FontWeight.w400,
            //                     fontSize: 16.sp),
            //               )),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            Row(
              children: [
                Container(color: kConstantPurple, height: 5.h, width: 119.w),
                Container(color: formLandingColor4, height: 5.h, width: 256.w)
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            ExitBackAndNextButtonsList(
                next: () {
                  if (_selectedIndex != -1) {
                    controllerAssessmentPageServices.submitAns(6, _selectedIndex - 1);
                    controllerAssessmentPageServices.secondary_ins = "";
                    if (_selectedIndex == 2) {
                      controllerAssessmentPageServices.secondary_ins = _textEditingController.text;
                    }
                  }
                  Get.to(const AssessmentPage8());
                },
                apiName: availableApiName.SaveAssessment),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
//////////////////////////////////////////////////////////////////////////////////////////////////
}
