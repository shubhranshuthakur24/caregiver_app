import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/shims/dart_ui_fake.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  VoidCallback voidCallback;
  String title;
  IconData iconData;

  CustomAppBar({required this.voidCallback, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 24.w,
              ),
              GestureDetector(
                onTap: voidCallback,
                child: Icon(
                  iconData,
                  color: kBlueGreyTextColor,
                  size: 22.0.r,
                ),
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontFamily: "TTCommons-Bold",
                  fontSize: 24.sp,
                  color: kBlueGreyTextColor,
                ),
              ),
              SizedBox(
                width: 11.w,
              ),
              SizedBox(
                width: 24.w,
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: kBlueGreyTextColor,
            thickness: 0.2.sp,
          )
        ],
      ),
    );
  }
}
