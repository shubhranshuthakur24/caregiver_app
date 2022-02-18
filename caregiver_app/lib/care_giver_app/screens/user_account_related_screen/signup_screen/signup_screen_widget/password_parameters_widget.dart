import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordParametersWidget extends StatefulWidget {
  const PasswordParametersWidget({Key? key}) : super(key: key);

  @override
  _PasswordParametersWidgetState createState() => _PasswordParametersWidgetState();
}

class _PasswordParametersWidgetState extends State<PasswordParametersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(text: "Has at least 8 characters"),
          textWidget(text: "Has letters, numbers, and special characters"),
          textWidget(text: "Not easy to guess")
        ],
      ),
    );
  }
}

textWidget({required String text}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "• ",
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, color: Colors.black),
      ),
      Text(
        text,
        style: TextStyle(fontFamily: "TTCommons-Bold", fontSize: 13.sp, fontWeight: FontWeight.w400),
      )
    ],
  );
}
