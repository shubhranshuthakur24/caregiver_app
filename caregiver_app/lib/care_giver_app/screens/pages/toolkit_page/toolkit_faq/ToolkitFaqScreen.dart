import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_faq/tool_kit_faq_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_faq/toolkit_card.dart';

import '../../../constants.dart';

class ToolKitFaqScreen extends StatefulWidget {
  const ToolKitFaqScreen({Key? key}) : super(key: key);

  @override
  _ToolKitFaqScreenState createState() => _ToolKitFaqScreenState();
}

class _ToolKitFaqScreenState extends State<ToolKitFaqScreen> {
  final controller = Get.put(ToolKitFaqServices());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SteelGrey,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GoBack(),
          title: Text(
            "FAQ's",
            style: ToolkitHeaderLarge(),
          ),
          backgroundColor: bootomNavBarBackgroundColor,
          elevation: 0.4,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
                padding:
                    EdgeInsets.only(left: 24.sp, right: 24.sp, bottom: 24.sp),
                child: Text(
                  "Tool Kit | FAQ's",
                  style: TextStyle(
                      fontSize: 14.sp, fontFamily: "TTCommons-DemiBold"),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Obx(() {
                return ToolKitFaqServices.dataList.isEmpty
                    ? Container(
                        height: 550.h,
                        child: Center(
                            child: showSpinkitRing(color: kConstantPurple)))
                    : SizedBox(
                        height: 550.h,
                        child: ListView.builder(
                            itemCount: ToolKitFaqServices.dataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ToolkitFAQCard(
                                cardText: ToolKitFaqServices
                                    .dataList[index].toolkitData.title,
                              );
                            }),
                      );
              }),
            )
          ],
        ),
        // body: CustomScrollView(
        //   shrinkWrap: true,
        //   physics: const ScrollPhysics(),
        //   slivers: [
        //     SliverAppBar(
        //       floating: true,
        //       pinned: true,
        //       backgroundColor: kToolKitBlue,
        //       // expandedHeight: 250.h,
        //       // collapsedHeight: 90.h,
        //       flexibleSpace: FlexibleSpaceBar(
        //         centerTitle: true,
        //         title: Row(
        //           children: [
        //             Container(
        //               margin: EdgeInsets.only(left: 20.sp, right: 12.sp),
        //               child: Icon(
        //                 CupertinoIcons.question,
        //                 color: Colors.white,
        //                 size: 24.sp,
        //               ),
        //             ),
        //             Text(
        //               "FAQ's",
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
        //                       ? Expanded(child: Container())
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
        //           color: kToolKitBlue,
        //         ),
        //       ),
        //     ),
        //     SliverToBoxAdapter(
        //       child: Padding(
        //         padding: EdgeInsets.only(top: 20.h),
        //         child: Obx(() {
        //           return ToolKitFaqServices.dataList.isEmpty
        //               ? showSpinkitRing(color: kConstantPurple)
        //               : SizedBox(
        //                   height: 550.h,
        //                   child: ListView.builder(
        //                       itemCount: ToolKitFaqServices.dataList.length,
        //                       itemBuilder: (BuildContext context, int index) {
        //                         return ToolkitFAQCard(
        //                           cardText: ToolKitFaqServices
        //                               .dataList[index].toolkitData.title,
        //                         );
        //                       }),
        //                 );
        //         }),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
