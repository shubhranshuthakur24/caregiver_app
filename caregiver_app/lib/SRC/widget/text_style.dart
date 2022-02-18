import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

Text TextFieldTittle(@required String string) {
  return Text(
    string,
    style: TextStyle(fontSize: 48.sp, color: Colors.white, letterSpacing: 0.3.sp, fontFamily: "Medium"),
  );
}

Text TextFieldContent(@required String string) {
  return Text(
    string,
    style: TextStyle(
      fontFamily: "Regular",
      fontSize: 24.sp,
      color: Colors.white,
      letterSpacing: 0.3.sp,
    ),
  );
}

TextStyle formQuestion() {
  return TextStyle(fontFamily: "Medium", fontSize: 36.sp, color: formLandingColor2);
}
