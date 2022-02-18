import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/my_loved_one_screen/my_loved_one_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/navigator_screen/navigator_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_card_v2.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bottom_buttons.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_update/care_giver_screen_update.dart';
import 'package:givershealths/care_giver_app/screens/pages/main_home_page.dart';
import 'package:givershealths/care_giver_app/screens/user_account_related_screen/signout_services/signout_services.dart';
import 'package:line_icons/line_icons.dart';

import '../../../constants.dart';

class UserBioScreen extends StatefulWidget {
  const UserBioScreen({Key? key}) : super(key: key);

  @override
  _UserBioScreenState createState() => _UserBioScreenState();
}

class _UserBioScreenState extends State<UserBioScreen> {
  final _userBioServicesController = Get.put(UserBioServices());
  bool _switchValue = true;

  @override
  void initState() {
    _userBioServicesController.data = Get.arguments[0];
    lovedOneProfileUrlUniversal.value = _userBioServicesController.data["data"]["loved_one_data"]["profile_pic_url"] ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: 900.h,
              color: SteelGrey,
              child: Stack(
                children: [
                  Container(
                      height: 545.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // colors: [Color(0xffb599CD3), Color(0xffb469BD1)],
                        colors: [Color(0xffb469BD1), Color(0xffb599CD3)],
                      )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 101.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => const MainHomePage());
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24.w,
                                ),
                                Icon(CupertinoIcons.back, color: Colors.white),
                                Text(
                                  "Back",
                                  style: TextStyle(color: Colors.white, fontFamily: "TTCommons-Medium", fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          InkWell(onTap: () {
                            Get.to(const CareGiverUpdateScreen());
                          }, child: Obx(() {
                            return userProfileUrlUniversal.value.isEmpty
                                ? nameImage(name: _userBioServicesController.data["data"]["cg_first_name"] ?? "")
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(userProfileUrlUniversal.value.toString()),
                                    radius: 60.r,
                                  );
                          })),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            (_userBioServicesController.data["data"]["cg_first_name"] ?? "") +
                                " " +
                                (_userBioServicesController.data["data"]["cg_last_name"] ?? ""),
                            style: TextStyle(fontSize: 24.sp, fontFamily: 'TTCommons-Medium', color: Colors.white),
                          ),
                          Text(
                            (_userBioServicesController.data["data"]["city"] ?? "") +
                                ", " +
                                (_userBioServicesController.data["data"]["state"] ?? ""),
                            style: TextStyle(
                              fontFamily: 'TTCommons-Medium',
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                        ],
                      )),
                  Positioned(
                      top: 357.h,
                      child: SizedBox(
                        width: 375.w,
                        child: Row(
                          children: [
                            Spacer(),
                            SizedBox(
                              width: 24.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const NavigatorScreen(),
                                    arguments: [_userBioServicesController.data["data"]["navigator_data"]["navigatorid"]]);
                              },
                              child: SizedBox(
                                width: 155.h,
                                height: 195.h,
                                child: UserBioCardV2(
                                    tittle: "MY NAVIGATOR",
                                    profile: _userBioServicesController.data["data"]["navigator_data"]["nav_profile_pic"] ?? "",
                                    body: (_userBioServicesController.data["data"]["navigator_data"]["city"] ?? "") +
                                        ", " +
                                        (_userBioServicesController.data["data"]["navigator_data"]["state"] ?? ""),
                                    name: (_userBioServicesController.data["data"]["navigator_data"]["nav_first_name"] + " ") +
                                        (_userBioServicesController.data["data"]["navigator_data"]["nav_last_name"] ?? "")),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const MyLovedOnesScreen(),
                                    arguments: [_userBioServicesController.data["data"]["loved_one_data"]["loved_oneid"]]);
                              },
                              child: SizedBox(
                                width: 155.h,
                                height: 195.h,
                                child: UserBioCardV2(
                                    tittle: "MY LOVED ONE",
                                    profile: _userBioServicesController.data["data"]["navigator_data"]["nav_profile_pic"] ?? "",
                                    body: "Age " +
                                        UserBioServices.ageCalculator(
                                            _userBioServicesController.data["data"]["loved_one_data"]["dob"] ?? "") +
                                        ", " +
                                        _userBioServicesController.data["data"]["loved_one_data"]["loved_one_gender"],
                                    name: _userBioServicesController.data["data"]["loved_one_data"]["first_name"] +
                                        " " +
                                        _userBioServicesController.data["data"]["loved_one_data"]["last_name"]),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 24.w,
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      top: 598.h,
                      width: 375.w,
                      child: Container(
                        color: Colors.white,
                        child: UserBioButtons(
                          tap: () {
                            Get.to(() => CareGiverUpdateScreen());
                          },
                          customIcon: LineIcons.fontAwesomeFlag,
                          customIconColor: kConstantUserProfileTextGreyColor,
                          text: "My Goal",
                        ),
                      )),
                  Positioned(
                      top: 660.h,
                      width: 375.w,
                      child: Container(
                        height: 53.h,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 23.w,
                            ),
                            Icon(
                              LineIcons.language,
                              color: kConstantUserProfileTextGreyColor,
                              size: 24.0,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Text(
                              "Preferred Language",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'TTCommons-DemiBold',
                                color: kConstantUserProfileTextGreyColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "English",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'TTCommons-DemiBold',
                                color: kConstantUserProfileTextGreyColor,
                              ),
                            ),
                            SizedBox(
                              width: 17.w,
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: 723.h,
                      width: 375.w,
                      child: Container(
                        color: Colors.white,
                        child: UserBioButtons(
                          tap: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text('Are You sure you want to log out?'),
                                      actions: [
                                        TextButton(
                                            onPressed: () => SignOutSerives.apiSignOut(TokenServices.token),
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(color: kConstantPurple),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "No",
                                              style: TextStyle(color: kConstantPurple),
                                            ))
                                      ],
                                    ));
                          },
                          customIcon: Icons.logout,
                          customIconColor: kConstantUserProfileTextGreyColor,
                          text: "Log Out",
                        ),
                      )),
                  Positioned(
                      top: 786.h,
                      width: 375.w,
                      child: Container(
                        height: 53.h,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 23.w,
                            ),
                            Text(
                              "Notification",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'TTCommons-DemiBold',
                                color: kConstantUserProfileTextGreyColor,
                              ),
                            ),
                            Spacer(),
                            CupertinoSwitch(
                              activeColor: Colors.lightGreen,
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 17.w,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Get.offAll(const MainHomePage());
          return false;
        });
  }
}
