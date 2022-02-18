import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/aaessment_form_lovedOnes_details/services/button_color_change_when_all_required_feild_are_filled.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/aaessment_form_lovedOnes_details/widget/assessment_form_lovedones_details_exit_back_button.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';

import '../../constants.dart';
import '../assessment_buttons.dart';
import '../assessment_widgets.dart';
import 'services/assessment_form_lovedones_details_services.dart';

class AssessmentFormLovedOnesDetailsScreen extends StatefulWidget {
  const AssessmentFormLovedOnesDetailsScreen({Key? key}) : super(key: key);

  @override
  _AssessmentFormLovedOnesDetailsScreenState createState() => _AssessmentFormLovedOnesDetailsScreenState();
}

class _AssessmentFormLovedOnesDetailsScreenState extends State<AssessmentFormLovedOnesDetailsScreen> {
  Color borderColor = Colors.white54;
  final AssessmentFormLovedOnesDetailsServices _assessmentFormLovedOnesDetailsServicesController =
      Get.put(AssessmentFormLovedOnesDetailsServices(), permanent: true);
  final LovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled
      _lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled =
      Get.put(LovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kConstantPaleWhite,
      body: SafeArea(
        child: SizedBox(
          width: 375.w,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(right: 24.sp, left: 24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 51.h),
                  Text(
                    "Your loved one’s basic info",
                    style: TextStyle(
                        color: kConstantGrey, fontSize: 24.sp, fontWeight: FontWeight.w600, fontFamily: 'TTCommons-DemiBold'),
                  ),
                  SizedBox(height: 48.h),
                  Padding(padding: EdgeInsets.only(left: 2.w), child: TextFieldTittle(textFildTittle: "Full Name")),
                  CustomTextFields(
                    controller: _lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled,
                    labelText: 'Full Name',
                    textEditingController: _assessmentFormLovedOnesDetailsServicesController.nameController,
                    tap: () {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 12.h),
                  Padding(padding: EdgeInsets.only(left: 2.w), child: TextFieldTittle(textFildTittle: "Zip Code")),
                  CustomTextFieldForZipCode(
                    controller: _lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled,
                    labelText: 'Zip Code',
                    textEditingController: _assessmentFormLovedOnesDetailsServicesController.zipCodeControler,
                    tap: () {},
                  ),
                  SizedBox(height: 12.h),
                  Padding(padding: EdgeInsets.only(left: 2.w), child: TextFieldTittle(textFildTittle: "Year of Birth")),
                  CustomTextFieldForYearOfBirth(
                    controller: _lovedOneDetilasButtonColorChangeWhenAllRequiredFieldAreFilled,
                    labelText: 'Year of Birth',
                    textEditingController: _assessmentFormLovedOnesDetailsServicesController.yearOfBirthControler,
                    tap: () {},
                  ),
                  SizedBox(height: 12.h),
                  GetBottomSheetForGender(_assessmentFormLovedOnesDetailsServicesController),
                  SizedBox(height: 12.h),
                  GetBottomSheetForEthnicity(_assessmentFormLovedOnesDetailsServicesController)
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Container(color: kConstantPurple, height: 5.h, width: 17.w),
                Container(color: formLandingColor4, height: 5.h, width: 358.w)
              ],
            ),
            SizedBox(height: 24.h),
            AssessmentFormLovedOnesDetilsEXitBackButton(
              next: () {
                _assessmentFormLovedOnesDetailsServicesController.textValidation();
                // Get.to(const AssessmentPage1());
              },
              apiName: availableApiName.UpdateLovedOneDetils,
            ),
            SizedBox(height: 36.h)
          ]),
        ),
      ),
    );
  }
}
