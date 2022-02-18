import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/main_home_page.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/dash_board_screen.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class SignInScreenServices extends GetxController {
  final RxBool signInButtonPressed = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> textFieldValidation() async {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
        showToast("Email can't be empty", color: Colors.red);
      } else {
        showToast("Please enter valid email", color: Colors.red);
      }
    } else if (passwordController.text.isEmpty) {
      showToast("Password can't be empty");
    } else {
      apiLogin();
    }
  }

  Future<String> apiLogin() async {
    signInButtonPressed.value = true;
    String res = "";
    if (GetPlatform.isWeb) {
      var response = await http.post(Uri.parse(ApiFile.loginApiUrl),
          body: ({
            "device_channelid": 3.toString(),
            "username": emailController.text.trim(),
            "password": passwordController.text.trim(),
          }));
      signInButtonPressed.value = false;
      var decoded = jsonDecode(response.body);
      showToast(decoded["response"]);
      if (response.statusCode == 200) {
        res = decoded["response"];
        if (decoded["status"] == "success") {
          TokenServices.tokenSave(
              token: decoded["token"],
              firebaseId: decoded["user_data"]["firebase_userid"],
              userid: decoded["user_data"]["userid"],
              // user_typeid: decoded["user_data"]["user_typeid"]
          );
          TokenServices.tokenRead();
          Get.delete<SignInScreenServices>();
          if (decoded["user_data"]["user_typeid"] == 2) {
            Get.offAll(() => const DashBoardScreen());
          } else if (decoded["user_data"]["user_typeid"] == 1) {
            Get.offAll(() => const MainHomePage());
          }
        }
      } else {
        signInButtonPressed.value = false;
        showToast('Request failed with status: ${response.statusCode}.');
        print('Request failed with status: ${response.statusCode}.');
      }
    } else {
      var response = await http.post(Uri.parse(ApiFile.loginApiUrl),
          body: ({
            "device_channelid": 3.toString(),
            "username": emailController.text.trim(),
            "password": passwordController.text.trim(),
            "device_token": await FirebaseMessaging.instance.getToken()
          }));
      signInButtonPressed.value = false;
      var decoded = jsonDecode(response.body);
      showToast(decoded["response"]);
      if (response.statusCode == 200) {
        res = decoded["response"];
        if (decoded["status"] == "success") {
          TokenServices.tokenSave(
              token: decoded["token"],
              firebaseId: decoded["user_data"]["firebase_userid"],
              userid: decoded["user_data"]["userid"],
              // user_typeid: decoded["user_data"]["user_typeid"]
          );
          TokenServices.tokenRead();
          Get.delete<SignInScreenServices>();
          if (decoded["user_data"]["user_typeid"] == 2) {
            Get.offAll(() => const DashBoardScreen());
          } else if (decoded["user_data"]["user_typeid"] == 1) {
            Get.offAll(() => const MainHomePage());
          }
        }
      } else {
        signInButtonPressed.value = false;
        showToast('Request failed with status: ${response.statusCode}.');
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    return res;
  }
}
