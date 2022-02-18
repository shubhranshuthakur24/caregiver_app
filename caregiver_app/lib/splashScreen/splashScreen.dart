import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/main_home_page.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/sign_in_screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    try {
      HomePageServices.apiGetCareGiverDetails(TokenServices.token);
    } catch (error) {}
    await Future.delayed(Duration(seconds: 3), () {});
    // TokenServices.token == "null" || TokenServices.firebaseUserId == "null" || TokenServices.user_typeid == "null"
    //     ? Get.offAll(() => const SignInScreen())
    //     : TokenServices.user_typeid == "1"
    //         ? Get.offAll(() => const MainHomePage())
    //         : Get.offAll(() => const DashBoardScreen())
    TokenServices.token == "null" || TokenServices.firebaseUserId == "null"
        ? Get.offAll(() => const SignInScreen())
        : Get.offAll(() => const MainHomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kConstantPurple,
        body: Center(
          child: Container(
            height: Get.height,
            child: Image(
                alignment: Alignment.centerLeft,
                width: 300.w,
                image: const AssetImage("images/logo_white.png")),
          ),
        ));
  }
}
