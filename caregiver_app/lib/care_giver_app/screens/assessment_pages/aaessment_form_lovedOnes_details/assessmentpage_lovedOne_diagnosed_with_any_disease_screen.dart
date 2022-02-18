import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../assessment_buttons.dart';
import 'services/assessment_form_lovedones_details_services.dart';

class assessmentpage_q2_diagnosed_with_any extends StatefulWidget {
  const assessmentpage_q2_diagnosed_with_any({Key? key}) : super(key: key);

  @override
  _assessmentpage_q2_diagnosed_with_anyState createState() => _assessmentpage_q2_diagnosed_with_anyState();
}

class _assessmentpage_q2_diagnosed_with_anyState extends State<assessmentpage_q2_diagnosed_with_any> {
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
                  itemCount: _assessmentFormLovedOnesDetailsServicesController.assessmentPageEmergencyRoomAnswerList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 45.h,
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              if (_assessmentFormLovedOnesDetailsServicesController
                                  .selectedListAssessmetnPageEmergencyRoomLovedOne
                                  .contains(index + 1)) {
                                _assessmentFormLovedOnesDetailsServicesController.selectedListAssessmetnPageEmergencyRoomLovedOne
                                    .remove(index + 1);
                              } else {
                                _assessmentFormLovedOnesDetailsServicesController.selectedListAssessmetnPageEmergencyRoomLovedOne
                                    .add(index + 1);
                              }
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: kConstantAssessmentButtonBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                            ),
                            side: BorderSide(
                                width: 2.sp,
                                color: _assessmentFormLovedOnesDetailsServicesController
                                        .selectedListAssessmetnPageEmergencyRoomLovedOne
                                        .contains(index + 1)
                                    ? kConstantPurple
                                    : Colors.black12),
                          ),
                          child: Text(
                              _assessmentFormLovedOnesDetailsServicesController.assessmentPageEmergencyRoomAnswerList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: _assessmentFormLovedOnesDetailsServicesController
                                          .selectedListAssessmetnPageEmergencyRoomLovedOne
                                          .contains(index + 1)
                                      ? kConstantPurple
                                      : Colors.black,
                                  fontWeight: _assessmentFormLovedOnesDetailsServicesController
                                          .selectedListAssessmetnPageEmergencyRoomLovedOne
                                          .contains(index + 1)
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  fontSize: 16.sp))),
                    );
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
            Obx(() {
              return _assessmentFormLovedOnesDetailsServicesController.nextButtonPressed.isTrue
                  ? showSpinkitRing(color: kConstantPurple)
                  : ExitBackAndNextButtonsList(
                      next: () {
                        _assessmentFormLovedOnesDetailsServicesController.apiUpdateLovedOneDeatils();
                      },
                      apiName: availableApiName.UpdateLovedOneDetils,
                    );
            }),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
}
