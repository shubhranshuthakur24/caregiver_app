import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/signin_screen.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/signup_screen/signup_screen.dart';

import '../constants.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: SteelGrey,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        // decoration: kConstantGradient(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 24.sp, left: 24.sp, top: 93.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Welcome to",
                    //   style: kConstantBigTextStyle(),
                    // ),
                    Image(
                      width: 250.w,
                      isAntiAlias: true,
                      alignment: Alignment.centerLeft,
                      image: const AssetImage("images/mainappimage1.png"),
                    ),
                    SizedBox(height: 16.h),
                    // Text(LanguageFile.function1()['find'].toString(),
                    //     style: kConstantSmallTextStyle()),
                  ],
                ),
              ),
              const Spacer(),
              // Text("width = ${MediaQuery.of(context).size.width}"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///Button for sign In
                  Container(
                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                      child: MediaQuery.of(context).size.width > 900
                          ? PurpleButtonDesktop(
                              text: "LOG IN",
                              press: () {
                                Get.to(const SignInScreen());
                              })
                          : PurpleButton(
                              text: "LOG IN",
                              press: () {
                                Get.to(const SignInScreen());
                              })),
                  SizedBox(height: 16.h),

                  /// Button For Sign Up
                  TextButton(
                      onPressed: () {
                        Get.to(const SignUpScreen());
                      },
                      child: Text(
                        "Don't have an account?",
                        style: kButtonTextStyle(),
                      )),
                  // Container(
                  //     child: MediaQuery.of(context).size.width > 750
                  //         ? MaterialButton(
                  //             elevation: 0,
                  //             height: 50.h,
                  //             minWidth: double.infinity,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(50),
                  //                 side: BorderSide(
                  //                     color: Colors.transparent, width: 0.sp)),
                  //             color: Colors.transparent,
                  //             splashColor: Colors.transparent,
                  //             hoverColor: Colors.transparent,
                  //             focusColor: Colors.transparent,
                  //             child: Text(
                  //               "Don't have an account?",
                  //               style: kButtonTextStyle(),
                  //             ),
                  //             onPressed: () {
                  //               Get.to(const SignUpScreen());
                  //             },
                  //           )
                  //         : MaterialButton(
                  //             elevation: 0,
                  //             height: 50.h,
                  //             minWidth: 326.w,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(50),
                  //                 side: BorderSide(
                  //                     color: Colors.transparent, width: 0.sp)),
                  //             color: Colors.transparent,
                  //             splashColor: Colors.transparent,
                  //             hoverColor: Colors.transparent,
                  //             child: Text(
                  //               "Don't have an account?",
                  //               style: kButtonTextStyle(),
                  //             ),
                  //             onPressed: () {
                  //               Get.to(const SignUpScreen());
                  //               // Navigator.pushNamed(context, SignUpScreen.id);
                  //               print("Going to sign up");
                  //             },
                  //           )),

                  SizedBox(height: 16.h)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
