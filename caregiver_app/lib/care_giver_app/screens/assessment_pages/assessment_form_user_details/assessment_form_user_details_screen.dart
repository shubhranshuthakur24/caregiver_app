import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/internationalization_using_getx/language_file.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/assessment_form_user_details/services/button_color_change_when_all_required_feild_are_filled.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';

import '../../constants.dart';
import '../assessment_widgets.dart';
import 'services/assessment_form_user_details_services.dart';

class AssessmentFormUserDetailsScreen extends StatefulWidget {
  const AssessmentFormUserDetailsScreen({Key? key}) : super(key: key);

  @override
  _AssessmentFormUserDetailsScreenState createState() => _AssessmentFormUserDetailsScreenState();
}

class _AssessmentFormUserDetailsScreenState extends State<AssessmentFormUserDetailsScreen> {
  final AssessmentFormUserDetailsServices _assessmentFormUserDetailsServicesController =
      Get.put(AssessmentFormUserDetailsServices(), permanent: true);
  ButtonColorChageWhenAllRequiredFeildAreFilled buttonColorChageWhenAllRequiredFeildAreFilled =
      Get.put(ButtonColorChageWhenAllRequiredFeildAreFilled());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kConstantPaleWhite,
      body: SafeArea(
        child: SizedBox(
          width: 375.w,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 24.sp, left: 24.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 48.h),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Let Us know About You",
                            style: TextStyle(
                                color: kConstantGrey,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'TTCommons-DemiBold'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 48.h),
                    Padding(padding: EdgeInsets.only(left: 2.w), child: TextFieldTittle(textFildTittle: "Zip Code")),
                    CustomTextFieldForZipCode(
                      controller: buttonColorChageWhenAllRequiredFeildAreFilled,
                      labelText: 'Zip Code',
                      textEditingController: _assessmentFormUserDetailsServicesController.zipCodeController,
                      tap: () {},
                    ),
                    SizedBox(height: 12.h),
                    Padding(padding: EdgeInsets.only(left: 2.w), child: TextFieldTittle(textFildTittle: "Year of Birth")),
                    CustomTextFieldForYearOfBirth(
                      controller: buttonColorChageWhenAllRequiredFeildAreFilled,
                      labelText: 'Year of Birth',
                      textEditingController: _assessmentFormUserDetailsServicesController.yearOfBirthController,
                      tap: () {},
                    ),
                    SizedBox(height: 12.h),
                    GetBottomSheetForGender(_assessmentFormUserDetailsServicesController),
                    SizedBox(height: 12.h),
                    GetBottomSheetForEthnicity(_assessmentFormUserDetailsServicesController)
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    color: kConstantPurple,
                    height: 5.h,
                    width: 5.w,
                  ),
                  Container(
                    color: formLandingColor4,
                    height: 5.h,
                    width: 370.w,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Obx(() {
                return _assessmentFormUserDetailsServicesController.nextButtonPressed.isTrue
                    ? showSpinkitRing(color: kConstantPurple)
                    : MaterialButton(
                        elevation: 0,
                        height: 50.h,
                        minWidth: 335.w,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                        ),
                        color: buttonColorChageWhenAllRequiredFeildAreFilled.allFieldAllVerifeid.isTrue
                            ? kConstantPurple
                            : kConstantInActiveButtonColor,
                        child: Text(
                          LanguageFile.function1()["Next"].toString(),
                          style: kButtonTextStyle(),
                        ),
                        onPressed: () {
                          _assessmentFormUserDetailsServicesController.textValidation();
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
