import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';

class AssessmentPagesPadding extends StatelessWidget {
  const AssessmentPagesPadding({required this.childWidget});

  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.sp, 46.sp, 24.sp, 0),
      child: childWidget,
    );
  }
}

///Text Field For Log In and Your Name , without obsecure text

class LogInTextFields extends StatefulWidget {
  const LogInTextFields({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);
  final String labelText;
  final String hintText;

  final TextEditingController textEditingController;

  @override
  State<LogInTextFields> createState() => _LogInTextFieldsState();
}

class TextFieldTittle extends StatefulWidget {
  String textFildTittle;

  TextFieldTittle({required this.textFildTittle});

  @override
  _TextFieldTittleState createState() => _TextFieldTittleState();
}

class _LogInTextFieldsState extends State<LogInTextFields> {
  bool onSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      margin: EdgeInsets.only(bottom: 9.h),
      child: TextField(
        onChanged: (value) {
          if (GetUtils.isLengthGreaterThan(value, 33)) {
            showToast("You can type max 10 characters.", color: Colors.red);
          }
        },
        maxLength: 34,
        controller: widget.textEditingController,
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
          // labelText: widget.labelText,
          // hintText: widget.hintText,
          floatingLabelStyle: const TextStyle(color: kBlueGreyTextColor),
          labelStyle: const TextStyle(color: kBlueGreyTextColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.sp),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    );
  }
}

class _TextFieldTittleState extends State<TextFieldTittle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 0.w, bottom: 7.h),
          child: Text(
            widget.textFildTittle,
            style: TextStyle(fontFamily: "TTCommons-Bold", fontSize: 15.sp, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final TextEditingController textEditingController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool onSelected = false;
  bool obscureTextPassword = true;
  Color colorPasswordEye = Colors.black45;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      margin: EdgeInsets.only(bottom: 9.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 2.sp),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        onChanged: (value) {
          if (GetUtils.isLengthGreaterThan(value, 33)) {
            showToast("You can type max 10 characters.", color: Colors.red);
          }
        },
        onTap: () {
          setState(() {
            onSelected = !onSelected;

            print("Tap");
          });
        },
        maxLength: 34,
        controller: widget.textEditingController,
        // keyboardType: const TextInputType.numberWithOptions(),
        obscureText: obscureTextPassword,
        showCursor: true,
        // cursorHeight: 20.h,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          iconColor: Colors.black,
          suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  if (obscureTextPassword == false) {
                    obscureTextPassword = true;
                    colorPasswordEye = Colors.black45;
                  } else {
                    obscureTextPassword = false;
                    colorPasswordEye = Colors.black;
                  }
                });
              },
              child: Icon(
                Icons.remove_red_eye_rounded,
                color: colorPasswordEye,
              )),
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          // labelText: widget.labelText,
          // hintText: widget.hintText,
          enabled: true,
          floatingLabelStyle: const TextStyle(color: kBlueGreyTextColor),
          labelStyle: const TextStyle(color: kBlueGreyTextColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.sp),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    );
  }
}

class PurpleButton extends StatelessWidget {
  const PurpleButton({required this.text, required this.press});

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 45.h,
      minWidth: double.infinity,
      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
      splashColor: kConstantPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
        side: BorderSide(color: kConstantPurple, width: 2.2.sp),
      ),
      color: kConstantPurple,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: kButtonTextStyle1(),
      ),
      onPressed: press,
    );
  }
}

class PurpleButtonDesktop extends StatelessWidget {
  const PurpleButtonDesktop({required this.text, required this.press});

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: MaterialButton(
        elevation: 0,
        height: 45.h,
        padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
        splashColor: kConstantPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: BorderSide(color: kConstantPurple, width: 2.2.sp),
        ),
        color: kConstantPurple,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: kButtonTextStyle1(),
        ),
        onPressed: press,
      ),
    );
  }
}
