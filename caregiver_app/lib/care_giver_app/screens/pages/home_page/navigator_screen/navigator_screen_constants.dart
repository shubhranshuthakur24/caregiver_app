import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

const Color kNavigatorBarBlue = Color(0xffe6e8ea);

TextStyle myNavigatorTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 36.sp,
    fontFamily: 'TTCommons.Bold',
    fontWeight: FontWeight.bold,
  );
}

TextStyle navigatorBioStyleText() {
  return TextStyle(
      fontSize: 20.sp,
      color: const Color(0xFF43525f),
      fontFamily: 'TTcommons-Regular');
}

CircleAvatar navigatorPhotoCircle(@required String imgUrl) {
  return CircleAvatar(
    backgroundColor: Colors.greenAccent,
    radius: 60.sp,
    // backgroundImage: const AssetImage("images/navigator.png"),
    backgroundImage: NetworkImage(imgUrl),
  );
}

TextStyle locationTextStyle() {
  return TextStyle(
      fontSize: 12.sp, color: kBlueGreyTextColor, fontWeight: FontWeight.w600);
}

TextStyle navigatorCardButtonsTextStyle() {
  return TextStyle(
      color: kConstantPurple, fontSize: 18.sp, letterSpacing: 1.8.sp);
}
