import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/request_reset_password_screen/request_reset_password.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/request_reset_password_screen/request_reset_password_services.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/reset_password_screen/services/countdown_services.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/reset_password_screen/services/reset_password_screen_services.dart';

import '../../../constants.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  RequestResetPasswordServices forgotPasswordServicesController = Get.find();
  ResetPasswordScreenServices resetPasswordScreenServicesController = Get.put(ResetPasswordScreenServices());
  CountdownSerices countdownServices = Get.put(CountdownSerices());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: kConstantPaleWhite,
          body: Padding(
            padding: EdgeInsets.fromLTRB(24.sp, 60.sp, 24.sp, 0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Verification Code",
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: kBlueGreyTextColor),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "We sent your code to " + forgotPasswordServicesController.emailController.text,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: kBlueGreyTextColor),
                  ),
                  // otpTimer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This Code will expire in ",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: kBlueGreyTextColor),
                      ),
                      Obx(() {
                        return Text(
                          countdownServices.start.value.toString(),
                          style: TextStyle(color: kBlueGreyTextColor),
                        );
                      }),
                      Text(
                        " second",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: kBlueGreyTextColor),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),
                  const OtpForm(),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Get.off(RequestResetPassword());
                        resetPasswordScreenServicesController.disposeCustom();
                      },
                      child: Text(
                        "Resend OTP?",
                        style: TextStyle(color: kConstantPurple, fontSize: 16.sp),
                      )),
                  MaterialButton(
                    minWidth: 327.w,
                    height: 50.h,
                    color: kConstantPurple,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(assessmentButtonBorderRadius)),
                    onPressed: () {
                      resetPasswordScreenServicesController.formValidationOtpScreen();
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(height: 36.h)
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          resetPasswordScreenServicesController.disposeCustom();
          Get.off(RequestResetPassword());
          return false;
        });
  }

  Row otpTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "This Code will expire in ",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: kBlueGreyTextColor),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 120.00, end: 00),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) => Text(
            value.toString(),
            // "00:${value.toString()}",
            style: TextStyle(color: Colors.red),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  ResetPasswordScreenServices resetPasswordScreenServicesController = Get.find();
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50.w,
          child: TextFormField(
            maxLength: 1,
            controller: resetPasswordScreenServicesController.firstDigitOtp,
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              nextField(value, pin2FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50.w,
          child: TextFormField(
            maxLength: 1,
            controller: resetPasswordScreenServicesController.secondDigitOtp,
            focusNode: pin2FocusNode,
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              nextField(value, pin3FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50.w,
          child: TextFormField(
            maxLength: 1,
            controller: resetPasswordScreenServicesController.thridDigitOtp,
            focusNode: pin3FocusNode,
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              nextField(value, pin4FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50.w,
          child: TextFormField(
            maxLength: 1,
            controller: resetPasswordScreenServicesController.fourthDigitOtp,
            focusNode: pin4FocusNode,
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              nextField(value, pin5FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50.w,
          child: TextFormField(
            maxLength: 1,
            controller: resetPasswordScreenServicesController.fifthDigitOtp,
            focusNode: pin5FocusNode,
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              nextField(value, pin6FocusNode);
            },
          ),
        ),
        SizedBox(
          width: 50.w,
          child: TextFormField(
            maxLength: 1,
            controller: resetPasswordScreenServicesController.sixthDigitOtp,
            focusNode: pin6FocusNode,
            style: TextStyle(fontSize: 24.sp),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: "",
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.sp), borderSide: const BorderSide(color: Colors.grey))),
            onChanged: (value) {
              pin6FocusNode.unfocus();
            },
          ),
        ),
      ],
    ));
  }
}
