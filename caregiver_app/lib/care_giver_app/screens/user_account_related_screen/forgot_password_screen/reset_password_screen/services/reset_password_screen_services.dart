import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/request_reset_password_screen/request_reset_password_services.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/signin_screen.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../new_password_screen.dart';

class ResetPasswordScreenServices {
  static String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExpPassword = RegExp(pattern);
  RxBool requestPasswordButtonPressed = false.obs;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstDigitOtp = TextEditingController();
  final secondDigitOtp = TextEditingController();
  final thridDigitOtp = TextEditingController();
  final fourthDigitOtp = TextEditingController();
  final fifthDigitOtp = TextEditingController();
  final sixthDigitOtp = TextEditingController();
  late String otpText;

  formValidationOtpScreen() {
    otpText = firstDigitOtp.text +
        secondDigitOtp.text +
        thridDigitOtp.text +
        fourthDigitOtp.text +
        fifthDigitOtp.text +
        sixthDigitOtp.text;
    if (otpText.length == 6) {
      Get.to(NewPasswords());
    } else {
      showToast("Please enter six digit OTP", color: Colors.red);
    }
  }

  formValidationNewPasswordScreen() {
    if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 5) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 5))) {
        showToast("password minimum length should six character");
      } else {
        showToast("Password must contains one upper case, one lower case, one numerical and one special character",
            color: Colors.red);
      }
    } else if (confirmPasswordController.text.isEmpty) {
      showToast("Please enter confirm password");
    } else if (passwordController.text == confirmPasswordController.text) {
      resetPassword();
    } else {
      showToast("Password and Confirm is not same", color: Colors.red);
    }
  }

  Future<void> resetPassword() async {
    requestPasswordButtonPressed.value = true;
    var response = await http.post(Uri.parse(ApiFile.resetPasswordApiUrl),
        body: ({
          "key": otpText,
          "password": passwordController.text.trim(),
        }));
    requestPasswordButtonPressed.value = false;
    var decoded = jsonDecode(response.body);
    showToast(decoded["response"]);
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        disposeCustom();
        Get.off(SignInScreen());
      }
    } else {
      showToast('Request failed with status: ${response.statusCode}.');
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  disposeCustom() {
    Get.delete<RequestResetPasswordServices>();
    Get.delete<ResetPasswordScreenServices>();
  }
}
