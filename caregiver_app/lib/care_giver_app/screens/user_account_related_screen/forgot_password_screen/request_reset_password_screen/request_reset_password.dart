import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/custom_app_bar.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';

import '../../../constants.dart';
import 'request_reset_password_services.dart';

class RequestResetPassword extends StatefulWidget {
  const RequestResetPassword({Key? key}) : super(key: key);

  @override
  _RequestResetPasswordState createState() => _RequestResetPasswordState();
}

class _RequestResetPasswordState extends State<RequestResetPassword> {
  RequestResetPasswordServices forgotPasswordServicesController = Get.put(RequestResetPasswordServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: () {},
      //     child: Icon(
      //       CupertinoIcons.xmark,
      //       color: kBlueGreyTextColor,
      //       size: 22.0.r,
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: kConstantPaleWhite,
      //   centerTitle: true,
      //   title: Text(
      //     "Reset Password",
      //     style: TextStyle(
      //       fontWeight: FontWeight.w400,
      //       fontFamily: "TTCommons-Bold",
      //       fontSize: 24.sp,
      //       color: kBlueGreyTextColor,
      //     ),
      //   ),
      // ),
      backgroundColor: kConstantPaleWhite,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 812.h,
        width: 375.w,
        // decoration: kConstantGradient(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              iconData: CupertinoIcons.xmark,
              title: "Reset Password",
              voidCallback: () {
                Get.back();
              },
            ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 5.w),
            //   child: InkWell(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: Icon(
            //       Icons.arrow_back_ios,
            //       color: Colors.grey.shade900,
            //       size: 30.0,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 45.sp),
            // Text(
            //   "Forgot Password ?",
            //   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 36.sp, wordSpacing: 0.3.sp),
            // ),
            // SizedBox(height: 10.h),
            // Text(
            //   "Reset Password In Two Easy Steps",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w400,
            //     fontSize: 12.sp,
            //   ),
            // ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                children: [
                  Text("Enter the email address associated with your account, and we'll email you a reset code"),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldTittle(textFildTittle: "Email"),
                  LogInTextFields(
                    hintText: "enter email address*",
                    labelText: 'Email*',
                    textEditingController: forgotPasswordServicesController.emailController,
                  ),
                  SizedBox(height: 20.h),
                  Obx(() {
                    return forgotPasswordServicesController.requestPasswordButtonPressed.isTrue
                        ? showSpinkitRing()
                        : Container(
                            height: 45.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: kConstantPurple,
                                borderRadius: BorderRadius.all(Radius.circular(assessmentButtonBorderRadius))),
                            child: MaterialButton(
                              onPressed: () {
                                forgotPasswordServicesController.emailTextValidation();
                                // Get.to(const OTPScreen());
                              },
                              child: Text(
                                "VERIFY",
                                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ),
            SizedBox(height: 36.h)
          ],
        ),
      ),
    );
  }
}
