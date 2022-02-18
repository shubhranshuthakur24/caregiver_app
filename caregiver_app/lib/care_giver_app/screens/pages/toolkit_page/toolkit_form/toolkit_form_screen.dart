import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_form/took_kit_form_services.dart';

import '../../../constants.dart';
import '../tool_kit_page_universal_services.dart';
import '../toolkit_universal_widgets.dart';

class ToolKitFormScreen extends StatefulWidget {
  const ToolKitFormScreen({Key? key}) : super(key: key);

  @override
  _ToolKitFormScreenState createState() => _ToolKitFormScreenState();
}

class _ToolKitFormScreenState extends State<ToolKitFormScreen> {
  final ToolKitFormServicesController = Get.put(ToolKitFormServices());

  @override
  void initState() {
    // TODO: implement initState
    ToolKitPageUniversalServices.screeName = "form";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SteelGrey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GoBack(),
            title: Text(
              "Forms",
              style: TextStyle(color: kBlueGreyTextColor, fontSize: 24.sp),
            ),
            backgroundColor: bootomNavBarBackgroundColor,
            elevation: 0.4),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
                padding: EdgeInsets.only(left: 24.sp, right: 24.sp, bottom: 24.sp),
                child: Text(
                  "Tool Kit | Forms",
                  style: TextStyle(fontSize: 14.sp, fontFamily: "TTCommons-DemiBold"),
                )),
            Container(
              height: 640.h,
              margin: EdgeInsets.only(
                left: 24.sp,
                right: 24.sp,
              ),
              child: Obx(() {
                return ToolKitFormServicesController.toolKitFormDataList.isEmpty
                    ? showSpinkitRing(color: kConstantPurple)
                    : ListView.builder(
                        itemCount: ToolKitFormServicesController.toolKitFormDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ToolkitCard(
                            // icon: ToolKitFormServicesController
                            //     .toolKitFormDataList[index].toolkitData.format,
                            isSaved: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.isSaved,
                            toolkit_typeid: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.toolkitid,
                            type: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.categoryData[0].category,
                            topicName: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.title,
                            cardText: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.info,
                            imageSourceString: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.mediaUrl,
                            tiletype: ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.format,
                            duration: ToolKitPageUniversalServices.durationFormatting(
                                ToolKitFormServicesController.toolKitFormDataList[index].toolkitData.duration),
                          );
                        });
              }),
            )
          ],
        ),
      ),
    );
  }
}
