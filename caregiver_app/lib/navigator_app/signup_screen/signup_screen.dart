import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';
import 'package:givershealths/navigator_app/login_Screen/login_screen_widgets.dart';

import '../main_home_page_navigator.dart';

class NavigatorSignUpScreen extends StatefulWidget {
  const NavigatorSignUpScreen({Key? key}) : super(key: key);

  @override
  _NavigatorSignUpScreenState createState() => _NavigatorSignUpScreenState();
}

class _NavigatorSignUpScreenState extends State<NavigatorSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const LoginTextField(hintText: "Your email", labelText: "Your email*"),
            const TextFieldforPassword(hintText: "Your password", labelText: "Your password*"),
            const TextFieldforPassword(hintText: "Confirm  password", labelText: "Confirm password*"),
            const Spacer(),
            MaterialButton(
              elevation: 0,
              height: 50.h,
              minWidth: 327.w,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), side: BorderSide(color: kConstantPurple, width: 0.8.sp)),
              color: kConstantPurple,
              child: Text('SIGN UP', textAlign: TextAlign.center, style: kButtonTextStyle1()),
              onPressed: () {
                Get.to(const NavigatorMainHomePage());
              },
            ),
            SizedBox(height: 10.h),
            PurpleButton(
                text: "BACK",
                press: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
}
