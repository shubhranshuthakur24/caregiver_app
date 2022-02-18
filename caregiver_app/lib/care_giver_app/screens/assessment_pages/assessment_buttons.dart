import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/SRC/internationalization_using_getx/language_file.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/aaessment_form_lovedOnes_details/services/assessment_form_lovedones_details_services.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/assessment_pages_services.dart';

import '../constants.dart';
import 'assessmentpage_emergencyRoom_numberOfTimes.dart';

enum availableApiName { UpdateLovedOneDetils, UpdateUserdetils, SaveAssessment }

class ExitBackAndNextButtonsList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  availableApiName apiName;

  ExitBackAndNextButtonsList({required this.apiName, required this.next});

  final VoidCallback next;
  RxBool buttonPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(width: 24.w),
          CircleAvatar(
            radius: 25.sp,
            backgroundColor: Colors.grey[300],
            child: Center(
              child: IconButton(
                splashColor: Colors.grey[300],
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SizedBox(
                      child: AlertDialog(
                          title: Text(
                            "Are you Sure you want to exit?",
                            style: TextStyle(color: kBlueGreyTextColor, fontSize: 36.sp),
                          ),
                          actions: <Widget>[
                            Center(
                              child: Image.asset(
                                'images/exit.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 23.sp, right: 17.sp),
                              child: Text("All the information you have filled out previously will be saved.",
                                  style: TextStyle(color: kBlueGreyTextColor, fontSize: 20.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                              child: MaterialButton(
                                  elevation: 0,
                                  minWidth: 130.w,
                                  splashColor: kConstantPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                                  ),
                                  color: kConstantPurple,
                                  child: Center(
                                    child: Text(
                                      "CANCEL",
                                      style: kButtonTextStyle(),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                            TextButton(onPressed: () {
                              buttonPressed.value = true;
                              if (apiName == availableApiName.UpdateLovedOneDetils) {
                                AssessmentFormLovedOnesDetailsServices assessmentFormLovedOnesDetailsServices = Get.find();
                                assessmentFormLovedOnesDetailsServices.apiUpdateLovedOneDeatils().then((value) {
                                  if (value == "failure") {
                                    buttonPressed.value = false;
                                    Get.to(() => const AssessmentPage3());
                                  }
                                });
                              } else if (apiName == availableApiName.SaveAssessment) {
                                AssessmentPagesSerivces assessmentPagesSerivces = Get.find();
                                assessmentPagesSerivces.apiSaveAssessmentApi().then((value) {
                                  buttonPressed.value = false;
                                });
                              } else if (apiName == availableApiName.UpdateUserdetils) {}
                              // Get.to(LandingScreen());
                            }, child: Center(
                              child: Obx(() {
                                return buttonPressed.isTrue
                                    ? showSpinkitRing(color: kConstantPurple)
                                    : Text(
                                        "EXIT NOW",
                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp, color: kConstantPurple),
                                      );
                              }),
                            )),
                          ]),
                    ),
                  );
                },
                iconSize: 28.sp,
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: MaterialButton(
              elevation: 0,
              height: 50.h,
              splashColor: kConstantPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                side: BorderSide(color: kConstantPurple, width: 2.2.sp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 18.sp,
                    color: kConstantPurple,
                  ),
                  Text(
                    LanguageFile.function1()["Back"].toString(),
                    style: TextStyle(
                      fontFamily: 'TTCommons-DemiBold',
                      color: kConstantPurple,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: MaterialButton(
              elevation: 0,
              height: 50.h,
              splashColor: kConstantPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                side: BorderSide(color: kConstantPurple, width: 2.sp),
              ),
              color: kConstantPurple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LanguageFile.function1()["Next"].toString(),
                    style: TextStyle(
                      fontFamily: 'TTCommons-DemiBold',
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                ],
              ),
              onPressed: next,
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
    );
  }
}
