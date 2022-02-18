import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

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
      height: 200.h,
      width: 337.w,
      decoration: BoxDecoration(
        color: kConstantLightBlue,
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
                    Text(
                      primaryInsuranceName,
                      style: userDetailTextStyle(),
                    ),
                  ],
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
    return TextStyle(color: kConstantBlue, fontSize: 22.sp, fontFamily: 'TTCommons-DemiBold');
  }
}

class MorePageDetailsButtons extends StatelessWidget {
  const MorePageDetailsButtons({required this.icon, required this.dataText, required this.iconColor, required this.questions});

  final String dataText;
  final String questions;

  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      width: 375.w,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      color: Colors.white,
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
                  color: kConstantPurple,
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

class PhotoCard extends StatelessWidget {
  const PhotoCard({Key? key, required this.imageLink, required this.lovedOneName}) : super(key: key);
  final String lovedOneName;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      width: 375.w,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 19.w),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.lightGreenAccent,
            backgroundImage: NetworkImage(imageLink),
          ),
          SizedBox(width: 25.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Loved One",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: kConstantGrey,
                ),
              ),
              Text(
                lovedOneName,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: kConstantPurple,
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
