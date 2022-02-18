import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class LightBlueCard extends StatelessWidget {
  const LightBlueCard(
      {required this.hospitalOfChoice,
      required this.primaryInsuranceName,
      required this.primaryCarePhysician,
      required this.secondaryInsuranceName});

  final String primaryInsuranceName;
  final String secondaryInsuranceName;
  final String primaryCarePhysician;
  final String hospitalOfChoice;

  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 337.w,
      decoration: BoxDecoration(
        // color: kConstantLightBlue,
        color: Colors.white,
        border: Border.all(color: kConstantBorderLightBlue),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PRIMARY INSURANCE', style: userQuestionsTextStyle()),
                    Container(
                      width: 300.w,
                      child: Text(
                        primaryInsuranceName,
                        style: userDetailTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SECONDARY INSURANCE', style: userQuestionsTextStyle()),
                        Text(
                          secondaryInsuranceName,
                          style: userDetailTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 16.w)
              ],
            ),
            Text(
              'PRIMARY CARE PHYSICIAN',
              style: userQuestionsTextStyle(),
            ),
            Text(
              primaryCarePhysician,
              style: userDetailTextStyle(),
            ),
            Text(
              "HOSPITAL OF CHOICE",
              style: userQuestionsTextStyle(),
            ),
            Text(
              hospitalOfChoice,
              style: userDetailTextStyle(),
            )
          ],
        ),
      ),
    );
  }

  TextStyle userQuestionsTextStyle() {
    return TextStyle(
        fontSize: 12.sp,
        color: kConstantGrey,
        letterSpacing: .6.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'TTCommons-DemiBold');
  }

  TextStyle userDetailTextStyle() {
    return TextStyle(color: Colors.grey.shade700, fontSize: 18.sp, fontFamily: 'TTCommons-DemiBold');
  }
}

class MyLovedOneDetailsButtons extends StatelessWidget {
  const MyLovedOneDetailsButtons({required this.icon, required this.dataText, required this.iconColor, required this.questions});

  final String dataText;
  final String questions;

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      width: 375.w,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 19.w),
          Icon(
            icon,
            size: 25.sp,
            color: iconColor,
          ),
          SizedBox(width: 25.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questions,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: kConstantGrey,
                ),
              ),
              Text(
                dataText,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
