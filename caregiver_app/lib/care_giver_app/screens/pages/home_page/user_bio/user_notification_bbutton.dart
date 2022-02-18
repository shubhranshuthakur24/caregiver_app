import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class UserNotificationButton extends StatefulWidget {
  const UserNotificationButton({Key? key}) : super(key: key);

  @override
  _UserNotificationButtonState createState() => _UserNotificationButtonState();
}

class _UserNotificationButtonState extends State<UserNotificationButton> {
  bool _flutter = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 51.h,
      child: SwitchListTile(
        title: Text(
          'Notification',
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: 'TTCommons-DemiBold',
            color: kConstantPurple,
            fontWeight: FontWeight.w500,
          ),
        ),
        value: _flutter,
        activeColor: kConstantPurple,
        inactiveTrackColor: Colors.grey,
        onChanged: (bool value) {
          setState(() {
            _flutter = value;
          });
        },
      ),
    );
  }
}
