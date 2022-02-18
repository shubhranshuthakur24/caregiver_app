import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_details_screen/tool_kit_details_screen_services.dart';

import '../../../constants.dart';

class ToolKitDetailsScreen extends StatefulWidget {
  const ToolKitDetailsScreen({Key? key}) : super(key: key);

  @override
  _ToolKitDetailsScreenState createState() => _ToolKitDetailsScreenState();
}

class _ToolKitDetailsScreenState extends State<ToolKitDetailsScreen> {
  late ToolKitDetailsScreenServices _toolKitDetailsScreenServicesController;

  @override
  void initState() {
    // TODO: implement initState
    ToolKitDetailsScreenServices.toolkitid = Get.arguments[0];
    _toolKitDetailsScreenServicesController = Get.put(ToolKitDetailsScreenServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kConstantPaleWhite,
          appBar: AppBar(
            backgroundColor: bootomNavBarBackgroundColor,
            title: Obx(() {
              return _toolKitDetailsScreenServicesController.dataToolKitDetails.isEmpty
                  ? Text("")
                  : Text(
                      _toolKitDetailsScreenServicesController.dataToolKitDetails[0].format,
                      style: TextStyle(color: kBlueGreyTextColor),
                    );
            }),
            centerTitle: false,
            leading: GoBack(),
            elevation: 0.4,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Obx(() {
                return _toolKitDetailsScreenServicesController.dataToolKitDetails.isEmpty
                    ? Container(height: Get.height, child: Center(child: showSpinkitRing(color: kConstantPurple)))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                              padding: EdgeInsets.only(
                                left: 30.w,
                                right: 24.w,
                              ),
                              child: Wrap(
                                children: [
                                  Text(
                                    "Resource Bundle | ${_toolKitDetailsScreenServicesController.dataToolKitDetails[0].toolkitType}",
                                    style: TextStyle(fontSize: 14.sp, fontFamily: "TTCommons-DemiBold"),
                                  ),
                                  Text(
                                    "| ${_toolKitDetailsScreenServicesController.dataToolKitDetails[0].title}",
                                    style:
                                        TextStyle(fontSize: 14.sp, fontFamily: "TTCommons-DemiBold", fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.sp,
                              right: 24.sp,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 30.h,
                                    left: 8.sp,
                                    right: 23.sp,
                                  ),
                                  child: Text(_toolKitDetailsScreenServicesController.dataToolKitDetails[0].title,
                                      style:
                                          TextStyle(fontSize: 24.sp, fontFamily: "TTCommons-Bold", fontWeight: FontWeight.bold)),
                                ),
                                Html(
                                  data: _toolKitDetailsScreenServicesController.dataToolKitDetails[0].info,
                                ),
                                SizedBox(height: 24.h),
                                Divider(),
                              ],
                            ),
                          ),
                        ],
                      );
              }),
            ),
          )),
    );
  }
}
