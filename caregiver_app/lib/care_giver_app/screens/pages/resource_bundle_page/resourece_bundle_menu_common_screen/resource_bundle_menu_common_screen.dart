import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_page_universal_services/resource_bundle_page_universal_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resourece_bundle_menu_common_screen/resource_card.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resourece_bundle_menu_common_screen/resoure_bundle_menu_common_screen_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_page_universal_services.dart';

import '../../../constants.dart';

class ResourceBundleMenuCommonScreen extends StatefulWidget {
  const ResourceBundleMenuCommonScreen({Key? key}) : super(key: key);

  @override
  _ResourceBundleMenuCommonScreenState createState() =>
      _ResourceBundleMenuCommonScreenState();
}

class _ResourceBundleMenuCommonScreenState
    extends State<ResourceBundleMenuCommonScreen> {
  ResourceBundelMenuCommonScreen _respiteScreenServices =
      Get.put(ResourceBundelMenuCommonScreen());

  @override
  void initState() {
    // TODO: implement initState
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
              ResourceBundlePageUniversalServices.selectedResourceBundleName,
              style: ToolkitHeaderLarge(),
            ),
            backgroundColor: bootomNavBarBackgroundColor,
            elevation: 0.4,
            leading: GoBack()),
        body: Obx(() {
          return _respiteScreenServices.data.isEmpty
              ? Container(
                  height: Get.height,
                  width: Get.width,
                  child: Center(
                    child: showSpinkitRing(color: kConstantPurple),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Divider(
                    //   height: 1.h,
                    // ),
                    SizedBox(height: 10.h),
                    Container(
                        padding: EdgeInsets.only(
                            left: 24.sp, right: 24.sp, bottom: 24.sp),
                        child: Text(
                          "Resource Bundle | ${ResourceBundlePageUniversalServices.selectedResourceBundleName}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "TTCommons-DemiBold"),
                        )),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _respiteScreenServices.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
                            child: Column(
                              children: [
                                ResourceCard(
                                  isSaved: false,
                                  // isSaved: _respiteScreenServices.data[index].toolkitData.isSaved,
                                  resourceid: _respiteScreenServices
                                      .data[index].resourceData.resourceid,
                                  format: _respiteScreenServices
                                      .data[index].resourceData.format,
                                  title: _respiteScreenServices
                                      .data[index].resourceData.title,
                                  info: _respiteScreenServices
                                      .data[index].resourceData.info,
                                  mediaUrl: _respiteScreenServices
                                      .data[index].resourceData.mediaUrl,
                                  tiletype: _respiteScreenServices
                                      .data[index].resourceData.format,
                                  duration: ToolKitPageUniversalServices
                                      .durationFormatting(_respiteScreenServices
                                          .data[index].resourceData.duration),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
