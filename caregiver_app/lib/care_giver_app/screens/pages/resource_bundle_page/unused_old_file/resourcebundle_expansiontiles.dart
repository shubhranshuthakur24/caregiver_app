// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_card_data_view_page/resourcebundle_card_data_page.dart';
//
// import '../../../constants.dart';
//
// class ResourceBundleExpansionTiles extends StatelessWidget {
//   ResourceBundleExpansionTiles(
//       {required this.onTapForOptions,
//       required this.cardType,
//       required this.dataTitle,
//       required this.tileIcon,
//       required this.cardData,
//       required this.onPressed,
//       required this.tileTitle,
//       required this.dataList});
//
//   final List<dynamic> dataList;
//   final IconData tileIcon;
//   final String tileTitle;
//   final String dataTitle;
//   final String cardData;
//   final VoidCallback onTapForOptions;
//   final String cardType;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.sp),
//       ),
//       color: Colors.white,
//       child: ExpansionTile(
//         backgroundColor: Colors.white,
//         collapsedIconColor: kConstantPurple,
//         iconColor: kConstantPurple,
//         expandedCrossAxisAlignment: CrossAxisAlignment.start,
//         childrenPadding: EdgeInsets.fromLTRB(14.sp, 0, 14.sp, 5.sp),
//         leading: Icon(tileIcon),
//         title: Text(tileTitle,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               color: kBlueGreyTextColor,
//               fontSize: 18.sp,
//               fontFamily: "TTCommons-DemiBold",
//             )),
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: dataList.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: [
//                       Divider(
//                         color: Colors.black26,
//                         thickness: .2.sp,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Text(
//                               dataList[index].resourceData.title.toString(),
//                               style: TextStyle(fontSize: 13.sp, color: kBlueGreyTextColor),
//                               softWrap: true,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               constraints: BoxConstraints(maxHeight: 30.h, maxWidth: 30.w),
//                               decoration:
//                                   BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.all(Radius.circular(5.sp))),
//                               child: Center(
//                                 child: IconButton(
//                                     icon: Icon(
//                                       CupertinoIcons.arrow_right,
//                                       size: 18.sp,
//                                     ),
//                                     onPressed: () {
//                                       Get.to(ResourceBundleCardDataViewPage(),
//                                           arguments: [dataList[index].resourceData.resourceid]);
//                                     }),
//                               ),
//                             ),
//                           ),
//                         ],
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                       ),
//                       SizedBox(height: 10.h),
//                       Text(
//                         dataList[index].resourceData.info.toString(),
//                         style: TextStyle(fontSize: 14.sp, color: kConstantGrey),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             cardType,
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               color: kConstantGrey,
//                             ),
//                           ),
//                           const Spacer(),
//                           IconButton(
//                             icon: Icon(
//                               Icons.more_horiz,
//                               size: 18.sp,
//                             ),
//                             onPressed: () {},
//                           )
//                         ],
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
