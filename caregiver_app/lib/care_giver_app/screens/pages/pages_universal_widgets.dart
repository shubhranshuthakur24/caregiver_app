import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class FilterAndSortButtons extends StatelessWidget {
  const FilterAndSortButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24.sp, left: 24.sp, top: 16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2.sp),
            spreadRadius: 1.sp,
            blurRadius: 1.sp,
            offset: Offset(0, 3.sp), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 600.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.sp, left: 16.sp, right: 16.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10.h),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Category",
                                            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Reset",
                                            style:
                                                TextStyle(fontSize: 14.sp, color: kConstantPurple, fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 5.sp,
                                      children: [
                                        FilterButtons(
                                          icon: CupertinoIcons.bed_double_fill,
                                          text: "Respite",
                                          pressed: () {},
                                        ),
                                        FilterButtons(
                                          icon: Icons.gavel,
                                          text: "Legal",
                                          pressed: () {},
                                        ),
                                        FilterButtons(
                                          icon: Icons.attach_money_outlined,
                                          text: "Financial",
                                          pressed: () {},
                                        ),
                                        FilterButtons(
                                          icon: CupertinoIcons.car_detailed,
                                          text: "Transportation",
                                          pressed: () {},
                                        ),
                                        FilterButtons(
                                          icon: Icons.devices,
                                          text: "Technology",
                                          pressed: () {},
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10.h),
                                      child: Text(
                                        "Type",
                                        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 5.sp,
                                      children: [
                                        FilterTypeButtons(text: "Article", pressed: () {}),
                                        FilterTypeButtons(text: "Video", pressed: () {}),
                                        FilterTypeButtons(text: "External Link", pressed: () {}),
                                        FilterTypeButtons(text: "Downloadable", pressed: () {}),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10.h),
                                      child: Text(
                                        "Length",
                                        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Wrap(
                                      spacing: 5.sp,
                                      children: [
                                        FilterTypeButtons(text: "Recommended", pressed: () {}),
                                        FilterTypeButtons(text: "Most Recent", pressed: () {}),
                                        FilterTypeButtons(text: "Alphabetically (A-Z)", pressed: () {}),
                                        FilterTypeButtons(text: "Alphabetically (Z-A)", pressed: () {}),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              Container(
                                width: double.infinity,
                                color: kConstantPurple,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "APPLY",
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.sp),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.sp),
                      bottomLeft: Radius.circular(10.sp),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_alt, size: 22.sp, color: kConstantPurple),
                      SizedBox(width: 8.sp),
                      Text(
                        "Filter",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: kConstantPurple),
                      )
                    ],
                  )),
            ),
          ),
          Container(
            height: 56.h,
            color: Colors.grey[200],
            width: 1.w,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.sp),
                    bottomRight: Radius.circular(10.sp),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.unfold_more_rounded, size: 22.sp, color: kConstantPurple),
                    SizedBox(width: 8.sp),
                    Text(
                      "Sort",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: kConstantPurple),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(height: 26.h),
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  const FilterButtons({required this.icon, required this.pressed, required this.text});

  final String text;
  final IconData icon;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: pressed,
      icon: Icon(
        icon,
        color: kConstantPurple,
      ),
      label: Text(
        text,
        style: TextStyle(color: kConstantPurple, fontSize: 16.sp),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.sp),
        ),
        side: BorderSide(width: 2.sp, color: kConstantPurple),
      ),
    );
  }
}

class FilterTypeButtons extends StatelessWidget {
  const FilterTypeButtons({required this.text, required this.pressed});

  final String text;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: pressed,
        child: Text(
          text,
          style: TextStyle(color: kConstantPurple, fontSize: 16.sp),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.sp),
          ),
          side: BorderSide(width: 2.sp, color: kConstantPurple),
        ));
  }
}
