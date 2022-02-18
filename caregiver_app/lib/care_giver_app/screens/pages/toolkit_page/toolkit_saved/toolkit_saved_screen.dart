import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_saved/tool_kit_saved_sevices.dart';

import '../../../constants.dart';
import '../tool_kit_page_universal_services.dart';
import '../toolkit_universal_widgets.dart';

class ToolkitSavedScreen extends StatefulWidget {
  const ToolkitSavedScreen({Key? key}) : super(key: key);

  @override
  _ToolkitSavedScreenState createState() => _ToolkitSavedScreenState();
}

class _ToolkitSavedScreenState extends State<ToolkitSavedScreen> {
  var _toolKitSavedServices = Get.put(ToolKitSavedServices());

  @override
  void initState() {
    // TODO: implement initState
    ToolKitPageUniversalServices.screeName = "saved";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SteelGrey,
        appBar: AppBar(
          leading: GoBack(),
          automaticallyImplyLeading: false,
          title: Text(
            "Saved",
            style: TextStyle(color: kBlueGreyTextColor, fontSize: 24.sp),
          ),
          backgroundColor: bootomNavBarBackgroundColor,
          elevation: 0.4,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
                child: Text(
                  "Tool Kit | Saved",
                  style: TextStyle(fontSize: 14.sp, fontFamily: "TTCommons-DemiBold"),
                )),
            Container(
              height: 640.h,
              margin: EdgeInsets.only(
                left: 24.sp,
                right: 24.sp,
              ),
              child: Obx(() {
                return _toolKitSavedServices.toolKitSavedDataList.isEmpty
                    ? showSpinkitRing(color: kConstantPurple)
                    : ListView.builder(
                        itemCount: _toolKitSavedServices.toolKitSavedDataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ToolkitCard(
                            // icon: _toolKitSavedServices
                            //     .toolKitSavedDataList[index].toolkit.format,
                            isSaved: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.isSaved,
                            toolkit_typeid: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.toolkitid,
                            type: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.categoryData[0].category,
                            topicName: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.title,
                            cardText: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.info,
                            imageSourceString: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.mediaUrl,
                            tiletype: _toolKitSavedServices.toolKitSavedDataList[index].toolkit.format,
                            duration: ToolKitPageUniversalServices.durationFormatting(
                                _toolKitSavedServices.toolKitSavedDataList[index].toolkit.duration),
                          );
                        });
              }),
            )
          ],
        ),
        // body: CustomScrollView(
        //   shrinkWrap: false,
        //   slivers: [
        //     SliverAppBar(
        //       floating: true,
        //       pinned: true,
        //       backgroundColor: kToolKitYellow,
        //       expandedHeight: 250.h,
        //       collapsedHeight: 90.h,
        //       flexibleSpace: FlexibleSpaceBar(
        //         centerTitle: true,
        //         title: Row(
        //           children: [
        //             Container(
        //               margin: EdgeInsets.only(left: 20.sp, right: 12.sp),
        //               child: Icon(
        //                 CupertinoIcons.bookmark,
        //                 color: Colors.white,
        //                 size: 24.sp,
        //               ),
        //             ),
        //             Text(
        //               "Saved",
        //               style: TextStyle(color: Colors.white, fontSize: 28.sp),
        //             ),
        //             const Spacer(),
        //             Container(
        //                 height: 35.h,
        //                 width: 35.h,
        //                 decoration: const BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   color: Colors.white,
        //                 ),
        //                 child: Obx(() {
        //                   return userProfileUrlUniversal.value.isEmpty
        //                       ? Container()
        //                       : InkWell(
        //                           onTap: () {
        //                             UserBioServices.apiGetCgProfile();
        //                           },
        //                           child: CircleAvatar(
        //                             backgroundImage: NetworkImage(
        //                                 userProfileUrlUniversal.toString()),
        //                           ),
        //                         );
        //                 })),
        //             SizedBox(
        //               width: 24.w,
        //             )
        //           ],
        //         ),
        //         background: Container(
        //           margin: EdgeInsets.only(left: 24.sp, right: 24.sp),
        //           color: kToolKitYellow,
        //         ),
        //       ),
        //     ),
        //     SliverToBoxAdapter(
        //       child: Column(
        //         children: [
        //           // const FilterAndSortButtons(),
        //           Container(
        //             height: 510.h,
        //             margin: EdgeInsets.only(left: 24.sp, right: 24.sp, top: 24.h),
        //             child: Obx(() {
        //               return _toolKitSavedServices.toolKitSavedDataList.isEmpty
        //                   ? showSpinkitRing(color: kConstantPurple)
        //                   : ListView.builder(
        //                       itemCount: _toolKitSavedServices
        //                           .toolKitSavedDataList.length,
        //                       itemBuilder: (BuildContext context, int index) {
        //                         return ToolkitCard(
        //                           isSaved: _toolKitSavedServices
        //                               .toolKitSavedDataList[index]
        //                               .toolkit
        //                               .isSaved,
        //                           toolkit_typeid: _toolKitSavedServices
        //                               .toolKitSavedDataList[index]
        //                               .toolkit
        //                               .toolkitid,
        //                           type: _toolKitSavedServices
        //                               .toolKitSavedDataList[index]
        //                               .toolkit
        //                               .categoryData[0]
        //                               .category,
        //                           topicName: _toolKitSavedServices
        //                               .toolKitSavedDataList[index].toolkit.title,
        //                           cardText: _toolKitSavedServices
        //                               .toolKitSavedDataList[index].toolkit.info,
        //                           imageSourceString: _toolKitSavedServices
        //                               .toolKitSavedDataList[index]
        //                               .toolkit
        //                               .mediaUrl,
        //                           tiletype: _toolKitSavedServices
        //                               .toolKitSavedDataList[index].toolkit.format,
        //                           duration: ToolKitPageUniversalServices
        //                               .durationFormatting(_toolKitSavedServices
        //                                   .toolKitSavedDataList[index]
        //                                   .toolkit
        //                                   .duration),
        //                         );
        //                       });
        //             }),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
