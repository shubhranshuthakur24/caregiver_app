import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_page_universal_services/resource_bundle_page_universal_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_detail/resource_detail_screen_services.dart';

import '../../../constants.dart';

class ResourceDetailScreen extends StatefulWidget {
  const ResourceDetailScreen({Key? key}) : super(key: key);

  @override
  _ResourceDetailScreenState createState() => _ResourceDetailScreenState();
}

class _ResourceDetailScreenState extends State<ResourceDetailScreen> {
  late ResourceDetailScreenServices _resourceDetailScreenServices;

  @override
  void initState() {
    // TODO: implement initState
    _resourceDetailScreenServices = Get.put(ResourceDetailScreenServices());
    _resourceDetailScreenServices.resourceid.value = Get.arguments[0];
    _resourceDetailScreenServices.apiGetResourceDetials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: SteelGrey,
          appBar: AppBar(
              title: Obx(() {
                return _resourceDetailScreenServices.ApiLoadFlag.value == false
                    ? Text("")
                    : Text(
                        _resourceDetailScreenServices.format.value,
                        style: TextStyle(color: kBlueGreyTextColor),
                      );
              }),
              // centerTitle: true,
              automaticallyImplyLeading: false,
              // leading: ToolkitPagesAppBar(
              //   type: '',
              // ),
              // backgroundColor: Colors.grey.shade300,
              backgroundColor: bootomNavBarBackgroundColor,
              elevation: 0,
              leading: GoBack()),
          body: SingleChildScrollView(
            child: Obx(() {
              return _resourceDetailScreenServices.ApiLoadFlag.value == false
                  ? Container(
                      height: Get.height,
                      child: Center(
                          child: showSpinkitRing(color: kConstantPurple)))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                left: 28.sp, right: 24.sp, bottom: 24.sp),
                            child: Wrap(
                              children: [
                                Text(
                                  "Resource Bundle | ${ResourceBundlePageUniversalServices.selectedResourceBundleName}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: "TTCommons-DemiBold"),
                                ),
                                Text(
                                  "| ${_resourceDetailScreenServices.title.value}",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: "TTCommons-DemiBold",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            top: 12.h,
                            left: 28.sp,
                            right: 23.sp,
                          ),
                          child: Text(_resourceDetailScreenServices.title.value,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontFamily: "TTCommons-Bold",
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.sp,
                            right: 24.sp,
                          ),
                          child: Column(
                            children: [
                              Html(
                                data: _resourceDetailScreenServices.info.value,
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                      ],
                    );
            }),
          )),
    );
  }
}
