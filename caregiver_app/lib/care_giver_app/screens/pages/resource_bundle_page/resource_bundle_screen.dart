import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_page_universal_services/resource_bundle_page_universal_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resourece_bundle_menu_common_screen/resource_bundle_menu_common_screen.dart';

import '../../constants.dart';

class ResourceBundleScreen extends StatefulWidget {
  const ResourceBundleScreen({Key? key}) : super(key: key);

  @override
  _ResourceBundleScreenState createState() => _ResourceBundleScreenState();
}

class _ResourceBundleScreenState extends State<ResourceBundleScreen> {
  // final controllerServicesResourceBundle = Get.put(ResourceBundlePageServices());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SteelGrey,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: SteelGrey,
      //   elevation: .5.sp,
      //   shadowColor: ShadowColor,
      // ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: 375.w,
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Container(
                  height: 65.h,
                  constraints: BoxConstraints(maxHeight: 72.h, maxWidth: 327.w),
                  child: Text("Resource Bundle",
                      style: TextStyle(
                          fontSize: 36.sp, fontFamily: 'TTCommons-Bold', fontWeight: FontWeight.bold, color: kBlueGreyTextColor)),
                ),
                Column(
                  children: [
                    SizedBox(height: 8.h),
                    NewResourceTabs(
                      onTap: () {
                        ResourceBundlePageUniversalServices.selectedResourceBundleName = "Respite";
                        ResourceBundlePageUniversalServices.resourceTypeid = "1";
                        Get.to(ResourceBundleMenuCommonScreen());
                      },
                      icon: CupertinoIcons.bed_double_fill,
                      dataType: "Respite",
                    ),
                    SizedBox(height: 8.h),
                    NewResourceTabs(
                      onTap: () {
                        ResourceBundlePageUniversalServices.selectedResourceBundleName = "Financial";
                        ResourceBundlePageUniversalServices.resourceTypeid = "2";
                        Get.to(ResourceBundleMenuCommonScreen());
                      },
                      icon: CupertinoIcons.money_dollar,
                      dataType: "Financial",
                    ),
                    SizedBox(height: 8.h),
                    NewResourceTabs(
                      onTap: () {
                        ResourceBundlePageUniversalServices.selectedResourceBundleName = "Transportation";
                        ResourceBundlePageUniversalServices.resourceTypeid = "3";
                        Get.to(ResourceBundleMenuCommonScreen());
                      },
                      icon: CupertinoIcons.car_detailed,
                      dataType: "Transportation",
                    ),
                    SizedBox(height: 8.h),
                    NewResourceTabs(
                      onTap: () {
                        ResourceBundlePageUniversalServices.selectedResourceBundleName = "Technology";
                        ResourceBundlePageUniversalServices.resourceTypeid = "4";
                        Get.to(ResourceBundleMenuCommonScreen());
                      },
                      icon: Icons.devices,
                      dataType: "Technology",
                    ),
                    SizedBox(height: 8.h),
                    NewResourceTabs(
                      onTap: () {
                        ResourceBundlePageUniversalServices.selectedResourceBundleName = "Legal";
                        ResourceBundlePageUniversalServices.resourceTypeid = "5";
                        Get.to(ResourceBundleMenuCommonScreen());
                      },
                      icon: Icons.gavel,
                      dataType: "Legal",
                    ),
                    SizedBox(height: 8.h),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewResourceTabs extends StatefulWidget {
  NewResourceTabs({Key? key, required this.onTap, required this.icon, required this.dataType});

  final String dataType;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<NewResourceTabs> createState() => _NewResourceTabsState();
}

class _NewResourceTabsState extends State<NewResourceTabs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 65.h,
        padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
        decoration:
            BoxDecoration(border: Border.all(color: ShadowColor), borderRadius: BorderRadius.circular(8.sp), color: Colors.white),
        // height: 80.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 12.w),
              Icon(
                widget.icon,
                color: kConstantPurple,
              ),
              SizedBox(width: 25.w),
              Text(
                widget.dataType,
                style: TextStyle(fontSize: 20.sp, color: kConstantGrey, fontFamily: 'TTCommons-DemiBold'),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_outlined, size: 16.sp, color: kConstantGrey),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}
