import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class ToolkitFAQCard extends StatelessWidget {
  ToolkitFAQCard({required this.cardText});

  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 24.sp),
      borderOnForeground: true,
      elevation: 2,
      shadowColor: ShadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      color: Colors.white,
      child: Container(
        constraints: BoxConstraints(minWidth: 327.w, minHeight: 82.h),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Row(
            children: [
              Icon(
                Icons.message_rounded,
                size: 25.sp,
                color: kToolKitBlue,
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Text(
                  cardText,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22.sp, color: kBlueGreyTextColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
