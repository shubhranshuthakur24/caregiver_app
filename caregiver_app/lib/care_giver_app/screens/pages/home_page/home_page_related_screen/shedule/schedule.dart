import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/calander/calander_popup_screen.dart';

import '../../../../constants.dart';

class ScheduleButton extends StatelessWidget {
  const ScheduleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return Container(
      height: 30.h,
      width: 145.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.sp)),
      ),
      child: OutlinedButton(
        onPressed: () {
          CalanderPopUpScreen.selectDate(context);
        },
        child: Center(
          child: Text(
            'View Schedule',
            style: TextStyle(color: kConstantPurple, fontSize: 12.sp),
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: kConstantPurple, width: 0.9.sp),
        ),
      ),
    );
  }
}
