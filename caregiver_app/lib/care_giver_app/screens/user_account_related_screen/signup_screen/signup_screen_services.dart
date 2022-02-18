import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/SRC/adapter/api_file.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/SRC/string_manipulation_function/string_manipulation.dart';
import 'package:givershealths/care_giver_app/screens/assessment_pages/assessmentpage_welcome.dart';
import 'package:givershealths/care_giver_app/screens/pages/main_home_page.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/signin_screen.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class SignupScreenServices extends GetxController {
  final RxBool buttonPressed = false.obs;
  String dropdownValue = '+47 Norway';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController confirmPasswordConfirmController = TextEditingController();
  static String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExpPassword = RegExp(pattern);

  ///Text Form Field Validator
  void textFieldValidation() {
    if (nameController.text.trim().isEmpty) {
      showToast("Name can't be empty", color: Colors.red);
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      if (emailController.text.trim().isEmpty) {
        showToast("Email can't be empty", color: Colors.red);
      } else {
        showToast("Please enter valid email", color: Colors.red);
      }
    } else if (!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 5) ||
        !regExpPassword.hasMatch(passwordController.text.trim())) {
      if ((!GetUtils.isLengthGreaterThan(passwordController.text.trim(), 5))) {
        showToast("password minimum length should six character");
      } else {
        showToast("Password must contains one upper case, one lower case, one numerical and one special character",
            color: Colors.red);
      }
    } else if (confirmPasswordConfirmController.text.trim().isEmpty) {
      showToast("Confirm password can't be empty", color: Colors.red);
    } else if (passwordController.text == confirmPasswordConfirmController.text) {
      apiSignUp();
    } else {
      showToast("Password and confirm password are not same", color: Colors.red);
    }
  }

  Future<String> apiSignUp() async {
    print("1");
    List<String> nameList = StringManipulation.nameSplit(fullname: nameController.text.trim());
    print("2");
    buttonPressed.value = true;
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.signUpApiUrl),
        body: (GetPlatform.isWeb
            ? {
                "device_channelid": 3.toString(),
                "email": emailController.text,
                // "country_code": dropdownValue,
                "username_type": "Email",
                "countryid": 101.toString(),
                "signup_type": "Email",
                "password": passwordController.text,
                "first_name": nameList[0],
                "last_name": nameList[1],
              }
            : {
                "device_channelid": 3.toString(),
                "email": emailController.text,
                // "country_code": dropdownValue,
                "username_type": "Email",
                "countryid": 101.toString(),
                "signup_type": "Email",
                "password": passwordController.text,
                "first_name": nameList[0],
                "last_name": nameList[1],
                "device_token": await FirebaseMessaging.instance.getToken()
              }));
    print("3");
    buttonPressed.value = false;
    var decoded = jsonDecode(response.body);
    print("Sameer Singh");
    print(decoded.toString());
    print("4");
    if (response.statusCode == 200) {
      if (decoded["status"] == "success") {
        print("5");
        showToast(decoded["status"]);
        TokenServices.tokenSave(
          token: decoded["token"],
          firebaseId: decoded["firebaseid"],
          userid: decoded["userid"],
          // user_typeid: decoded["userid"]
        );
        print("6");
        TokenServices.tokenRead();
        print("7");
        Get.offAll(const AssessmentPage());
        print("8");
        Get.delete<SignupScreenServices>();
      } else if (decoded["response"] == "User already exist") {
        userAlreadyExitsSignIn();
      }
    } else {
      showToast("SignUp failed", color: Colors.red);
      print('Request failed with status: ${response.statusCode}.');
    }

    return res;
  }

  void userAlreadyExitsSignIn() {
    buttonPressed.value = true;
    apiLogin(emailController.text.toString(), passwordController.text.toString()).then((value) {
      buttonPressed.value = false;

      if (value == "Incorrect Username/Password.") {
        showToast("User already exist, You are redirected to the sign in page.");
        Get.to(const SignInScreen());
      } else {
        Get.delete<SignupScreenServices>();
      }
    });
  }

  Future<String> apiLogin(String email, String password) async {
    String res = "";
    var response = await http.post(Uri.parse(ApiFile.loginApiUrl),
        body: ({
          "device_channelid": 3.toString(),
          "username": email,
          "password": password,
          "device_token": await FirebaseMessaging.instance.getToken()
        }));
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      res = decoded["response"];
      if (decoded["status"] == "success") {
        TokenServices.tokenSave(
          token: decoded["token"],
          firebaseId: decoded["firebase_userid"],
          userid: decoded["userid"],
          // user_typeid: decoded["user_typeid"]
        );
        TokenServices.tokenRead();
        Get.offAll(const MainHomePage());
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return res;
  }
}
