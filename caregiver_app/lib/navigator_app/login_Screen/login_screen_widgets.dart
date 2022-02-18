import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);
  final String labelText;
  final String hintText;

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 60.h, maxWidth: 420.w),
      width: 327.w,
      margin: EdgeInsets.only(bottom: 9.h),
      child: TextField(
        maxLength: 34,
        showCursor: true,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          hintText: widget.hintText,
          floatingLabelStyle: const TextStyle(color: kBlueGreyTextColor),
          labelStyle: const TextStyle(color: kBlueGreyTextColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(50.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.sp),
            borderRadius: BorderRadius.circular(50.sp),
          ),
        ),
      ),
    );
  }
}

class TextFieldforPassword extends StatefulWidget {
  const TextFieldforPassword({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);
  final String labelText;
  final String hintText;

  @override
  _TextFieldforPasswordState createState() => _TextFieldforPasswordState();
}

class _TextFieldforPasswordState extends State<TextFieldforPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 60.h, maxWidth: 420.w),
      width: 327.w,
      margin: EdgeInsets.only(bottom: 9.h),
      child: TextField(
        maxLength: 34,
        showCursor: true,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          hintText: widget.hintText,
          floatingLabelStyle: const TextStyle(color: kBlueGreyTextColor),
          labelStyle: const TextStyle(color: kBlueGreyTextColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(50.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.sp),
            borderRadius: BorderRadius.circular(50.sp),
          ),
        ),
      ),
    );
  }
}
