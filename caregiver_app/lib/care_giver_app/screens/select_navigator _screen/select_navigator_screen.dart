import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/select_navigator%20_screen/select_navigator_widgets.dart';
import 'package:givershealths/care_giver_app/screens/select_navigator%20_screen/services/select_navigator_screen_services.dart';

import '../constants.dart';
import 'services/controller_select_navigator.dart';

class SelectNavigator extends StatefulWidget {
  const SelectNavigator({Key? key}) : super(key: key);

  @override
  _SelectNavigatorState createState() => _SelectNavigatorState();
}

class _SelectNavigatorState extends State<SelectNavigator> {
  final controller = Get.put(ControllerSelectNavigator());
  int _navigatorid = -1.obs;
  late String navName;
  late String navProfileUrl;
  late String navAddress;

  // Color bgColor = Colors.white54;
  // Color borderColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: kConstantGradient(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 76.h),
              Text(
                "Select 1 Navigator",
                style: TextStyle(
                    fontSize: 36.sp,
                    color: kBlueGreyTextColor,
                    letterSpacing: -0.3.sp,
                    fontFamily: 'TTCommons-Medium'),
              ),
              SizedBox(height: 34.h),
              Expanded(
                child: SizedBox(
                  child: Obx(() {
                    return controller.avilableNavigatorList.isEmpty
                        ? Center(child: showSpinkitCircle())
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.avilableNavigatorList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  navName = controller
                                          .avilableNavigatorList[index]
                                          .firstName +
                                      " " +
                                      controller.avilableNavigatorList[index]
                                          .lastName;
                                  navAddress = controller
                                          .avilableNavigatorList[index].city +
                                      " " +
                                      controller
                                          .avilableNavigatorList[index].state;
                                  navProfileUrl = controller
                                      .avilableNavigatorList[index]
                                      .profilePicUrl;
                                  setState(() {
                                    _navigatorid = controller
                                        .avilableNavigatorList[index]
                                        .navigatorid;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 16.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _navigatorid ==
                                                controller
                                                    .avilableNavigatorList[
                                                        index]
                                                    .navigatorid
                                            ? kConstantPurple
                                            : ShadowColor,
                                        width: 2.5.sp),
                                    color: _navigatorid ==
                                            controller
                                                .avilableNavigatorList[index]
                                                .navigatorid
                                        ? Colors.white
                                        : Colors.white54,
                                    borderRadius: BorderRadius.circular(12.sp),
                                  ),
                                  child: NavigatorCard(
                                    imageUrl: controller
                                        .avilableNavigatorList[index]
                                        .profilePicUrl,
                                    navigatorBio: controller
                                        .avilableNavigatorList[index].bio,
                                    navigatorLocation: controller
                                            .avilableNavigatorList[index].city +
                                        " " +
                                        controller
                                            .avilableNavigatorList[index].state,
                                    navigatorName: controller
                                            .avilableNavigatorList[index]
                                            .firstName +
                                        " " +
                                        controller.avilableNavigatorList[index]
                                            .lastName,
                                  ),
                                ),
                              );
                            });
                  }),
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                width: 327.w,
                height: 50.h,
                margin: EdgeInsets.only(bottom: 12.sp),
                decoration: BoxDecoration(
                  color: kConstantPurple,
                  border: Border.all(
                    color: kConstantPurple,
                    width: 2.w,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100.sp)),
                ),
                child: Obx(() {
                  return ControllerSelectNavigator.buttonPressed.isTrue
                      ? Center(child: showSpinkitCircle())
                      : TextButton(
                          onPressed: () {
                            if (_navigatorid.isEqual(-1)) {
                              showToast("Please select one navigator");
                            } else {
                              ControllerSelectNavigator.buttonPressed.value =
                                  true;
                              SelectNavigatorScreenServices.apiSelectNavigator(
                                  TokenServices.token,
                                  _navigatorid,
                                  navName,
                                  navProfileUrl,
                                  navAddress);
                            }
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                letterSpacing: 1.8.sp),
                          ));
                }),
              ),
              SizedBox(height: 36.h)
            ],
          ),
        ),
      ),
    );
  }
}
