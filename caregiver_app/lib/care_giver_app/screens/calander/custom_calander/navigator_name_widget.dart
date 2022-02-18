import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../calendar_services.dart';

class NavigatorNameWidget extends StatefulWidget {
  const NavigatorNameWidget({Key? key}) : super(key: key);

  @override
  _NavigatorNameWidgetState createState() => _NavigatorNameWidgetState();
}

class _NavigatorNameWidgetState extends State<NavigatorNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 5.h),
        child: Text(
          CalendarServices.navName,
          style: TextStyle(fontFamily: 'TTCommons-Medium', fontSize: 28.sp),
        ));
  }
}
