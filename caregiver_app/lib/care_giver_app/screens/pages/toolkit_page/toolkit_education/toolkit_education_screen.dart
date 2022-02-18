import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_education/toolkit_education_services.dart';

import '../../../constants.dart';
import '../tool_kit_page_universal_services.dart';
import '../toolkit_universal_widgets.dart';

class ToolkitEducationScreen extends StatefulWidget {
  const ToolkitEducationScreen({Key? key}) : super(key: key);

  @override
  _ToolkitEducationScreenState createState() => _ToolkitEducationScreenState();
}

class _ToolkitEducationScreenState extends State<ToolkitEducationScreen> {
  String tittle = Get.arguments[0];
  int toolkit_typeid1 = Get.arguments[1];
  ToolkitEducationServices _toolkitEducationServicesController =
      Get.put(ToolkitEducationServices());

  // final controller = Get.put(ControllerToolkitResources(1));
  @override
  void initState() {
    // TODO: implement initState
    ToolKitPageUniversalServices.screeName = "education";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: SteelGrey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Education",
              style: ToolkitHeaderLarge(),
            ),
            backgroundColor: bootomNavBarBackgroundColor,
            elevation: 0.4,
            leading: GoBack()

            // automaticallyImplyLeading: false,
            // title: const ToolkitPagesAppBar(
            //   type: "Education",
            // ),
            // backgroundColor: bootomNavBarBackgroundColor,
            // elevation: 0.4,

            ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
                padding:
                    EdgeInsets.only(left: 24.sp, right: 24.sp, bottom: 24.sp),
                child: Text(
                  "Tool Kit | Education",
                  style: TextStyle(
                      fontSize: 14.sp, fontFamily: "TTCommons-DemiBold"),
                )),
            Obx(() {
              return _toolkitEducationServicesController.data.isEmpty
                  ? Container(
                      height: 550,
                      width: Get.width,
                      child: Center(
                        child: showSpinkitRing(color: kConstantPurple),
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            _toolkitEducationServicesController.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
                            child: Column(
                              children: [
                                ToolkitCard(
                                  isSaved: _toolkitEducationServicesController
                                      .data[index].toolkitData.isSaved,
                                  toolkit_typeid:
                                      _toolkitEducationServicesController
                                          .data[index].toolkitData.toolkitid,
                                  type: _toolkitEducationServicesController
                                      .data[index]
                                      .toolkitData
                                      .categoryData[0]
                                      .category,
                                  topicName: _toolkitEducationServicesController
                                      .data[index].toolkitData.title,
                                  cardText: _toolkitEducationServicesController
                                      .data[index].toolkitData.info,
                                  imageSourceString:
                                      _toolkitEducationServicesController
                                          .data[index].toolkitData.mediaUrl,
                                  tiletype: _toolkitEducationServicesController
                                      .data[index].toolkitData.format,
                                  duration: ToolKitPageUniversalServices
                                      .durationFormatting(
                                          _toolkitEducationServicesController
                                              .data[index]
                                              .toolkitData
                                              .duration),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }

  TextStyle ToolkitHeaderLarge() {
    return TextStyle(
        fontFamily: "TTCommons-Bold",
        color: kBlueGreyTextColor,
        fontSize: 24.sp);
  }
}
