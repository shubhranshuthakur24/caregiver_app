import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class UserBioButtons extends StatelessWidget {
  UserBioButtons({required this.customIcon, required this.customIconColor, required this.text, this.tap});

  final IconData customIcon;
  final Color customIconColor;
  final String text;
  GestureTapCallback? tap;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 53.h,
      child: InkWell(
        onTap: tap,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 29.sp, top: 16.sp, bottom: 12.sp),
              child: Icon(
                customIcon,
                size: 25.sp,
                color: customIconColor,
              ),
            ),
            SizedBox(width: 28.w),
            Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'TTCommons-DemiBold',
                color: kConstantUserProfileTextGreyColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
