import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../assessment_buttons.dart';
import 'services/assessment_form_lovedones_details_services.dart';

class AssessmentPageRelationshipWithLovedOneScreeen extends StatefulWidget {
  const AssessmentPageRelationshipWithLovedOneScreeen({Key? key}) : super(key: key);

  @override
  _AssessmentPageRelationshipWithLovedOneScreeenState createState() => _AssessmentPageRelationshipWithLovedOneScreeenState();
}

class _AssessmentPageRelationshipWithLovedOneScreeenState extends State<AssessmentPageRelationshipWithLovedOneScreeen> {
  final AssessmentFormLovedOnesDetailsServices _assessmentFormLovedOnesDetailsServicesController = Get.find();

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
                text: "What is your relationship with your loved one",
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
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 55.h,
                      margin: EdgeInsets.symmetric(vertical: 5.sp),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _assessmentFormLovedOnesDetailsServicesController.selectedIndexRelationshipWithYourLovedOne =
                                  index + 1;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: kConstantAssessmentButtonBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                            ),
                            side: BorderSide(
                                width: 2.sp,
                                color:
                                    _assessmentFormLovedOnesDetailsServicesController.selectedIndexRelationshipWithYourLovedOne ==
                                            index + 1
                                        ? kConstantPurple
                                        : Colors.black12),
                          ),
                          child: Text(
                            _assessmentFormLovedOnesDetailsServicesController.relationshipWithYourLovedOneAnswerList[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color:
                                    _assessmentFormLovedOnesDetailsServicesController.selectedIndexRelationshipWithYourLovedOne ==
                                            index + 1
                                        ? kConstantPurple
                                        : Colors.black,
                                fontWeight:
                                    _assessmentFormLovedOnesDetailsServicesController.selectedIndexRelationshipWithYourLovedOne ==
                                            index + 1
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                fontSize: 16.sp),
                          )),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Container(color: kConstantPurple, height: 5.h, width: 40.w),
                Container(color: formLandingColor4, height: 5.h, width: 335.w)
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            ExitBackAndNextButtonsList(
                next: () {
                  _assessmentFormLovedOnesDetailsServicesController.formValidationAssessmentPageRelationshipWithLovedOne();
                },
                apiName: availableApiName.UpdateLovedOneDetils),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
}
