import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/forgot_password_screen/reset_password_screen/otp_screen.dart';
import 'package:http/http.dart' as http;

import '../../../constants.dart';

class RequestResetPasswordServices {
  final emailController = TextEditingController();
  RxBool requestPasswordButtonPressed = false.obs;

  void emailTextValidation() {
    if (emailController.text.toString().isEmpty) {
      showToast("Please enter Email", color: Colors.red);
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      showToast("Please enter valid email", color: Colors.red);
    } else {
      requestResetPassword();
    }
  }

  Future<void> requestResetPassword() async {
    requestPasswordButtonPressed.value = true;
    var response = await http.post(Uri.parse(ApiFile.requestResetPasswordApiUrl),
        body: ({
          "country_code": "12345",
          "username": emailController.text.toString().trim(),
        }));
    requestPasswordButtonPressed.value = false;
    var decoded = jsonDecode(response.body);
    showToast(decoded["status"]);
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        Get.to(OTPScreen());
      }
    } else {
      showToast('Request failed with status: ${response.statusCode}.');
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
