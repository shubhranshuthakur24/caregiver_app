import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';

List<String> genderList = [
  "Gender",
  "Male",
  "Female",
  "Non-Binary",
  "Prefer Not to Say"
];

class GetBottomSheetForGender extends StatefulWidget {
  var controller;

  GetBottomSheetForGender(this.controller);

  @override
  _GetBottomSheetForGenderState createState() =>
      _GetBottomSheetForGenderState();
}

class _GetBottomSheetForGenderState extends State<GetBottomSheetForGender> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          border: Border.all(
              color: selected == false ? Colors.black12 : kConstantPurple,
              width: 2.sp)),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                genderList[widget.controller.genderId.value],
                textAlign: TextAlign.left,
                style: TextStyle(color: kBlueGreyTextColor, fontSize: 16.sp),
              ),
            ),
          ],
        ),
        onPressed: () {
          selected != selected;

          setState(() {});
          showModalBottomSheet(
              context: context,
              builder: (builder) {
                return Container(
                  height: 350.h,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 8.h),
                      Text(
                        'Gender',
                        style: TextStyle(
                            fontSize: 12.sp, color: kBlueGreyTextColor),
                      ),
                      SizedBox(
                        height: 77.h,
                        child: TextButton(
                          onPressed: () {
                            widget.controller.genderId.value = 1;

                            Get.back();
                            setState(() {});
                          },
                          child: Text(
                            'Male',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: kBlueGreyTextColor,
                              fontFamily: "TTCommons-Regular",
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.h,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 77.h,
                        child: TextButton(
                          onPressed: () {
                            widget.controller.genderId.value = 2;
                            Get.back();

                            setState(() {});
                          },
                          child: Text(
                            'Female',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: kBlueGreyTextColor,
                              fontFamily: "TTCommons-Regular",
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.h,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 77.h,
                        child: TextButton(
                          onPressed: () {
                            widget.controller.genderId.value = 3;

                            Get.back();

                            setState(() {});
                          },
                          child: Text(
                            'Non-Binary',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: kBlueGreyTextColor,
                              fontFamily: "TTCommons-Regular",
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.h,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 77.h,
                        child: TextButton(
                          onPressed: () {
                            widget.controller.genderId.value = 4;

                            Get.back();
                            setState(() {});
                          },
                          child: Text(
                            'Prefer Not to Say',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w400,
                              color: kBlueGreyTextColor,
                              fontFamily: "TTCommons-Regular",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}

List<String> ethnicityList = [
  "Select Race/Ethnicity",
  "Hispanic, Latino or Spanish origin",
  "American Indian or Alaska Native",
  "Asian",
  "Black or African American",
  "Native Hawaiian or Other Pacific Islander",
  "Prefer Not to Say"
];

class GetBottomSheetForEthnicity extends StatefulWidget {
  var controller;

  GetBottomSheetForEthnicity(this.controller);

  @override
  _GetBottomSheetForEthnicityState createState() =>
      _GetBottomSheetForEthnicityState();
}

class _GetBottomSheetForEthnicityState
    extends State<GetBottomSheetForEthnicity> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          border: Border.all(
              color: selected == false ? Colors.black12 : kConstantPurple,
              width: 2.sp)),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(
                ethnicityList[widget.controller.ethnicityId.value],
                textAlign: TextAlign.center,
                style: TextStyle(color: kBlueGreyTextColor, fontSize: 16.sp),
              ),
            ),
          ],
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (builder) {
                return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 8.h),
                        Text(
                          'Race/Ethnicity',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: kBlueGreyTextColor),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 1;

                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(
                              text: 'Hispanic, Latino or Spanish origin',
                            ),
                          ),
                        ),
                        Divider(
                          height: 1.h,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 2;

                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(
                              text: 'American Indian or Alaska Native',
                            ),
                          ),
                        ),
                        Divider(height: 1.h, color: Colors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 3;

                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(text: 'White/Caucasian'),
                          ),
                        ),
                        Divider(height: 1.h, color: Colors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 4;

                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(text: 'Asian'),
                          ),
                        ),
                        Divider(height: 1.h, color: Colors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 5;
                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(
                              text: 'Black or African American',
                            ),
                          ),
                        ),
                        Divider(height: 1.h, color: Colors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 6;
                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(
                              text: 'Native Hawaiian or Other Pacific Islander',
                            ),
                          ),
                        ),
                        Divider(height: 1.h, color: Colors.grey),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              widget.controller.ethnicityId.value = 7;
                              Get.back();
                              setState(() {});
                            },
                            child: DropDownButtonText(
                              text: 'Prefer Not to Say',
                            ),
                          ),
                        )
                      ],
                    ));
              });
        },
      ),
    );
  }
}

class DropDownButtonText extends StatelessWidget {
  const DropDownButtonText({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          color: kBlueGreyTextColor),
    );
  }
}

class CustomTextFields extends StatefulWidget {
  final controller;

  CustomTextFields(
      {required this.controller,
      required this.labelText,
      required this.tap,
      this.textEditingController});

  final String labelText;
  final GestureTapCallback tap;

  TextEditingController? textEditingController;

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 430.w, maxHeight: 60.h),
      width: 327.w,
      child: TextField(
        onChanged: (value) {
          widget.controller.textValidation();
          if (GetUtils.isLengthGreaterThan(value, 33)) {
            showToast("You can type max 33 characters.", color: Colors.red);
          }
        },
        maxLength: 34,
        controller: widget.textEditingController,
        // keyboardType: const TextInputType.numberWithOptions(),
        onTap: widget.tap,
        showCursor: true,
        // cursorHeight: 20.h,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          hintText: "Full Name",
          hintStyle: const TextStyle(color: Colors.black38),
          floatingLabelStyle: const TextStyle(color: kConstantGrey),
          labelStyle: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.w500),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldForZipCode extends StatefulWidget {
  final String labelText;
  final GestureTapCallback tap;
  final TextEditingController textEditingController;
  final controller;

  CustomTextFieldForZipCode(
      {required this.labelText,
      required this.tap,
      required this.textEditingController,
      required this.controller});

  @override
  State<CustomTextFieldForZipCode> createState() =>
      _CustomTextFieldForZipCodeState();
}

class _CustomTextFieldForZipCodeState extends State<CustomTextFieldForZipCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 430.w, maxHeight: 60.h),
      width: double.infinity,
      child: TextField(
        onChanged: (text) {
          widget.controller.textValidation();
        },
        maxLength: 5,
        controller: widget.textEditingController,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],

        onTap: widget.tap,
        showCursor: true,
        // cursorHeight: 20.h,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          hintText: "Zip Code",
          hintStyle: const TextStyle(color: Colors.black38),
          floatingLabelStyle: const TextStyle(color: kConstantGrey),
          labelStyle: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.w500),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldForYearOfBirth extends StatefulWidget {
  final String labelText;
  final GestureTapCallback tap;
  final controller;

  CustomTextFieldForYearOfBirth(
      {required this.labelText,
      required this.tap,
      required this.controller,
      this.textEditingController});

  TextEditingController? textEditingController;

  @override
  State<CustomTextFieldForYearOfBirth> createState() =>
      _CustomTextFieldForYearOfBirthState();
}

class _CustomTextFieldForYearOfBirthState
    extends State<CustomTextFieldForYearOfBirth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 430.w, maxHeight: 60.h),
      width: double.infinity,
      child: TextField(
        onChanged: (text) {
          widget.controller.textValidation();
        },
        maxLength: 4,
        controller: widget.textEditingController,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onTap: widget.tap,
        showCursor: true,
        // cursorHeight: 20.h,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          hintText: "Year of birth",
          hintStyle: const TextStyle(color: Colors.black38),
          floatingLabelStyle: const TextStyle(color: kConstantGrey),
          labelStyle: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.w500),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
        ),
      ),
    );
  }
}
