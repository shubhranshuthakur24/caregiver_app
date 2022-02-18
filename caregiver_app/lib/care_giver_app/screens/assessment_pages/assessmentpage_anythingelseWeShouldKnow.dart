import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../constants.dart';
import 'assessmentPage_12_pages.dart';
import 'assessment_buttons.dart';
import 'assessment_pages_services.dart';

class AssessmentPage20ForText extends StatefulWidget {
  const AssessmentPage20ForText({Key? key}) : super(key: key);

  @override
  _AssessmentPage20ForTextState createState() => _AssessmentPage20ForTextState();
}

class _AssessmentPage20ForTextState extends State<AssessmentPage20ForText> {
  AssessmentPagesSerivces controllerAssessmentPageServices = Get.find();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(maxWidth: 375.w),
          color: kConstantPaleWhite,
          child: Column(
            children: [
              const AssessmentQuestions(text: "Anything else you would like us to know about you or your loved one?"),
              SizedBox(height: 40.h),
              Container(
                child: MediaQuery.of(context).size.width > 750
                    ? Container(
                        margin: EdgeInsets.only(left: 14.sp, right: 14.sp),
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: kBorderGrey)),
                        child: TextField(
                          controller: textEditingController,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: kConstantPurple,
                          cursorHeight: 30.h,
                          style: TextStyle(fontSize: 20.sp, fontFamily: 'TTCommons-DemiBold'),
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: "Let us know more information here.",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.sp)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.sp)),
                            helperText: "Max 100 Words",
                            contentPadding: EdgeInsets.all(10.sp),
                            constraints: BoxConstraints(maxWidth: double.infinity.w, maxHeight: 300.h),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: 14.sp, right: 14.sp),
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: kBorderGrey)),
                        child: TextField(
                          controller: textEditingController,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: kConstantPurple,
                          style: TextStyle(fontSize: 16.sp, fontFamily: 'TTCommons-DemiBold'),
                          maxLines: 15,
                          decoration: InputDecoration(
                            hintText: "Let us know more information here.",
                            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16.sp),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.sp)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.sp)),
                            helperText: "Max 100 Words",
                            contentPadding: EdgeInsets.all(10.sp),
                            constraints: BoxConstraints(maxWidth: 365.w, maxHeight: 257.h),
                          ),
                        ),
                      ),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(color: kConstantPurple, height: 5.h, width: 323.w),
                  Container(color: formLandingColor4, height: 5.h, width: 52.w)
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              ExitBackAndNextButtonsList(
                next: () {
                  controllerAssessmentPageServices.priority = textEditingController.text;
                  Get.to(const AssessmentPage1or2QuestionsMore());
                },
                apiName: availableApiName.SaveAssessment,
              ),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }
}
