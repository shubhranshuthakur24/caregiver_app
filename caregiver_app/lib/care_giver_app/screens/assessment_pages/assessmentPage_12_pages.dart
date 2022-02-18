import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants.dart';
import 'assessment_pages_services.dart';

class AssessmentPage1or2QuestionsMore extends StatefulWidget {
  const AssessmentPage1or2QuestionsMore({Key? key}) : super(key: key);

  @override
  _AssessmentPage1or2QuestionsMoreState createState() => _AssessmentPage1or2QuestionsMoreState();
}

class _AssessmentPage1or2QuestionsMoreState extends State<AssessmentPage1or2QuestionsMore> {
  TextEditingController textEditingController = TextEditingController();
  AssessmentPagesSerivces controllerAssessmentPageServices = Get.find();

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
              const AssessmentQuestions(
                  text:
                      "Let us know the top 1-2 things you need help with right now in helping care for your loved one and yourself."),
              SizedBox(height: 40.h),
              Container(
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
              const Spacer(),
              Row(
                children: [
                  Container(color: kConstantPurple, height: 5.h, width: 375.w),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              // SizedBox(height: 264.h),
              Obx(() {
                return controllerAssessmentPageServices.submitButtonPressed.isTrue
                    ? showSpinkitRing(color: kConstantPurple)
                    : MaterialButton(
                        elevation: 0,
                        height: 50.h,
                        minWidth: 339.w,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                          side: BorderSide(color: kConstantPurple, width: 2.2.sp),
                        ),
                        color: kConstantPurple,
                        child: Text(
                          "DONE",
                          style: kButtonTextStyle(),
                        ),
                        onPressed: () {
                          controllerAssessmentPageServices.moreinfo = textEditingController.text;
                          controllerAssessmentPageServices.apiSaveAssessmentApi();
                          // Navigator.pushNamed(context, AssessmentPage1.id);
                        },
                      );
              }),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }
}
