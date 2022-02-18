import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

var TextSize = 12.sp;

Container SignInScreenBottomTextWidget() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "By logging in, you agree to our ",
              style: TextStyle(fontFamily: 'TTCommons-ExtraLight', fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "Terms of Use, Privacy Policy,",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              "and ",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "HIPAA Notice ",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "(HIPAA Notice ",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "applicable ",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "to all ",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "U.S. ",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              "Residents",
              style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
            Text(
              " only.)",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: TextSize),
            ),
          ],
        )
      ],
    ),
  );
}
