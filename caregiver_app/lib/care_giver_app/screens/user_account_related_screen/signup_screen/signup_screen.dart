import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/signup_screen/signup_screen_widget/password_parameters_widget.dart';

import '../../constants.dart';
import 'signup_screen_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupScreenServices _signupScreenServicesController = Get.put(SignupScreenServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: SteelGrey,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 35.h),
          child: Column(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kBlueGreyTextColor,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontFamily: 'TTCommons-Regular', color: kBlueGreyTextColor, fontSize: 40.sp, wordSpacing: -0.3.sp),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                TextFieldTittle(textFildTittle: "Name"),
                LogInTextFields(
                    textEditingController: _signupScreenServicesController.nameController,
                    labelText: "Your Name*",
                    hintText: "Your Name"),
                TextFieldTittle(textFildTittle: "Email"),
                LogInTextFields(
                    hintText: "Your email",
                    textEditingController: _signupScreenServicesController.emailController,
                    labelText: "Your email*"),
                TextFieldTittle(textFildTittle: "Password"),
                PasswordTextField(
                    hintText: "Your Password*",
                    textEditingController: _signupScreenServicesController.passwordController,
                    labelText: "Your Password*"),
                TextFieldTittle(textFildTittle: "Confirm Password"),
                PasswordTextField(
                    hintText: "Confirm Password*",
                    textEditingController: _signupScreenServicesController.confirmPasswordConfirmController,
                    labelText: "Confirm Password*"),
                PasswordParametersWidget()
              ]),
              Spacer(),
              Column(
                children: [
                  Obx(() {
                    return _signupScreenServicesController.buttonPressed.isTrue
                        ? showSpinkitRing()
                        : SizedBox(
                            child: PurpleButton(
                                text: "CREATE ACCOUNT",
                                press: () {
                                  _signupScreenServicesController.textFieldValidation();
                                }));
                  }),
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
