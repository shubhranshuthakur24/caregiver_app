import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/request_reset_password_screen/request_reset_password.dart';

import '../main_home_page_navigator.dart';
import 'login_screen_widgets.dart';

class NavigatorLogInScreen extends StatefulWidget {
  const NavigatorLogInScreen({Key? key}) : super(key: key);

  @override
  _NavigatorLogInScreenState createState() => _NavigatorLogInScreenState();
}

class _NavigatorLogInScreenState extends State<NavigatorLogInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: kConstantGradientNew(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 93.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 24.w, left: 24.w),
                child: Center(
                  child: Text("Welcome Navigator",
                      style: TextStyle(
                        fontFamily: "TTCommons-Medium",
                        fontSize: 38.sp,
                        color: Colors.white,
                        letterSpacing: 0.3.sp,
                      )),
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              const LoginTextField(hintText: "Your email", labelText: "Your email*"),
              const TextFieldforPassword(hintText: "Your password", labelText: "Your password*"),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(const RequestResetPassword());
                },
                child: Text(
                  "Forgot Password..?",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ),
              MaterialButton(
                elevation: 0,
                height: 50.h,
                minWidth: 327.w,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50), side: BorderSide(color: kConstantPurple, width: 0.8.sp)),
                color: kConstantPurple,
                child: Text('SIGN IN', textAlign: TextAlign.center, style: kButtonTextStyle1()),
                onPressed: () {
                  Get.to(const NavigatorMainHomePage());
                },
              ),
              SizedBox(height: 36.h)
            ],
          ),
        ),
      ),
    );
  }
}
