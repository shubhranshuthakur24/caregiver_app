import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/url_launcher/url_launcher.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/request_reset_password_screen/request_reset_password.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/sign_in_screen_services.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/signup_screen/signup_screen.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/signup_screen/signup_screen_widget/sign_in_screen_bottom_text_widget.dart';
import 'package:givershealths/care_giver_app/screens/webView.dart';

import '../../constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInScreenServices _signInScreenServicesController =
      Get.put(SignInScreenServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: SteelGrey,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   foregroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 19.w, left: 19.w),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Image(
                    height: 100.h,
                    width: 200.w,
                    isAntiAlias: true,
                    alignment: Alignment.centerLeft,
                    image: const AssetImage("images/logopurplebackground.png"),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: TextFieldTittle(textFildTittle: "Email"),
                  ),
                  LogInTextFields(
                    hintText: "Your email",
                    textEditingController:
                        _signInScreenServicesController.emailController,
                    labelText: "Your email*",
                  ),
                  // SignInScreenTextField(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: TextFieldTittle(textFildTittle: "Password"),
                  ),
                  PasswordTextField(
                    hintText: "Password*",
                    textEditingController:
                        _signInScreenServicesController.passwordController,
                    labelText: "Your Password*",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(children: [
                    Obx(() {
                      return _signInScreenServicesController
                              .signInButtonPressed.isTrue
                          ? showSpinkitRing()
                          : Container(
                              width: 327.w,
                              child: PurpleButton(
                                  text: "LOG IN",
                                  press: () {
                                    _signInScreenServicesController
                                        .textFieldValidation();
                                  }));
                    }),
                    SizedBox(height: 10.h)
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          if (GetPlatform.isAndroid || GetPlatform.isIOS) {
                            Get.to(WebViews(url: "https://www.givers.health/"));
                          } else {
                            UrlLauncher.launchURL("givers.health/");
                          }
                        },
                        child: Text(
                          "About Givers Health",
                          style: TextStyle(
                              color: kConstantPurple,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent),
                        ),
                        onPressed: () {
                          Get.to(const RequestResetPassword());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: kConstantPurple,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SignInScreenBottomTextWidget(),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(const SignUpScreen());
                      },
                      child: Text("Apply Now",
                          style: TextStyle(
                              color: kConstantPurple,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp))),
                ],
              ),
              SizedBox(height: 26.h)
            ],
          ),
        ),
      ),
    );
  }
}
