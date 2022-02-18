import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/reset_password_screen/services/reset_password_screen_services.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/signup_screen/signup_screen_widget/password_parameters_widget.dart';

import '../../../constants.dart';

class NewPasswords extends StatefulWidget {
  const NewPasswords({Key? key}) : super(key: key);

  @override
  _NewPasswordsState createState() => _NewPasswordsState();
}

class _NewPasswordsState extends State<NewPasswords> {
  ResetPasswordScreenServices resetPasswordScreenServicesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kConstantPaleWhite,
      body: Container(
        color: kConstantPaleWhite,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.sp, 60.sp, 24.sp, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create New Password",
                  style: TextStyle(color: kBlueGreyTextColor, fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.sp),
                Text(
                  "Your new password must be different from your old password",
                  style: TextStyle(color: kBlueGreyTextColor, fontSize: 16.sp),
                ),
                SizedBox(height: 25.sp),
                PasswordTextField(
                  controller: resetPasswordScreenServicesController.passwordController,
                  hintText: 'Password',
                  labelText: "Password",
                ),
                PasswordTextField(
                  controller: resetPasswordScreenServicesController.confirmPasswordController,
                  hintText: 'Confirm Password',
                  labelText: "Confirm Password",
                ),
                PasswordParametersWidget(),
                Spacer(),
                Obx(() {
                  return resetPasswordScreenServicesController.requestPasswordButtonPressed.isTrue
                      ? showSpinkitRing(color: kConstantPurple)
                      : MaterialButton(
                          minWidth: 327.w,
                          height: 50.h,
                          color: kConstantPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(assessmentButtonBorderRadius)),
                          onPressed: () {
                            resetPasswordScreenServicesController.formValidationNewPasswordScreen();
                          },
                          child: Text(
                            "RESET PASSWORD",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp, letterSpacing: .4, fontWeight: FontWeight.w500),
                          ),
                        );
                }),
                SizedBox(height: 36.h)

                ///2 textfields
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    // required this.textEditingController,
    required this.labelText,
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  // final TextEditingController textEditingController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool onSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 420.w),
      width: 327.w,
      height: 80.h,
      margin: EdgeInsets.only(bottom: 9.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 2.sp),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: widget.controller,
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
        // controller: widget.textEditingController,
        obscureText: true,
        showCursor: true,
        cursorColor: kConstantPurple,
        textDirection: TextDirection.ltr,
        autofocus: true,
        decoration: InputDecoration(
          counterText: "",
          // iconColor: Colors.black,
          // suffixIcon: const Icon(
          //   Icons.remove_red_eye_rounded,
          //   color: Colors.black,
          // ),
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          hintText: widget.hintText,
          enabled: true,
          floatingLabelStyle: const TextStyle(color: kBlueGreyTextColor),
          labelStyle: const TextStyle(color: kBlueGreyTextColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.sp),
            borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
          ),
        ),
      ),
    );
  }
}
