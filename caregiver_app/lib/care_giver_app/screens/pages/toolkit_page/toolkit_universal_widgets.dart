// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:givershealths/SRC/adapter/token_services.dart';
// import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_details_screen/tool_kit_details_screen.dart';
// import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_page_universal_services.dart';
//
// import '../../constants.dart';
//
// class ToolKitAppBar extends StatelessWidget {
//   const ToolKitAppBar({required this.color, required this.icon});
//
//   final Color color;
//   final IconData icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: color,
//       centerTitle: false,
//       toolbarHeight: 60.h,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       leading: Icon(
//         icon,
//         size: 20.sp,
//       ),
//       title: Text("Forms",
//           textAlign: TextAlign.left,
//           style: TextStyle(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontFamily: "TTCommons-Bold")),
//       actions: [
//         CircleAvatar(
//           backgroundColor: Colors.white70,
//           child: Container(
//             height: 35.w,
//             width: 35.w,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//             ),
//             child: Image.asset("images/navigator2.png"),
//           ),
//         ),
//         SizedBox(width: 12.sp)
//       ],
//     );
//   }
// }
//
// class CustomSliverAppBar extends StatelessWidget {
//   const CustomSliverAppBar({required this.color, required this.icon});
//
//   final Color color;
//   final IconData icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: color,
//       centerTitle: false,
//       toolbarHeight: 60.h,
//       elevation: 0,
//       automaticallyImplyLeading: false,
//       leading: Icon(
//         icon,
//         size: 20.sp,
//       ),
//       title: Text("Forms",
//           textAlign: TextAlign.left,
//           style: TextStyle(
//               fontSize: 24.sp,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontFamily: "TTCommons-Bold")),
//       actions: [
//         Container(
//           height: 35.w,
//           width: 35.w,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//           ),
//           child: Image.asset("images/navigator2.png"),
//         ),
//         SizedBox(width: 12.sp)
//       ],
//     );
//   }
// }
//
// class ToolKitBarButtons extends StatelessWidget {
//   const ToolKitBarButtons(
//       {required this.icon,
//       required this.text,
//       required this.color,
//       required this.tap});
//
//   final Color color;
//   final String text;
//   final IconData icon;
//   final VoidCallback tap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: tap,
//       child: MediaQuery.of(context).size.width > 750
//           ? Container(
//               height: 80.h,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.sp),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding:
//                     EdgeInsets.only(left: 16.sp, top: 12.sp, bottom: 12.sp),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: color,
//                       radius: 28.sp,
//                       child: Center(
//                         child: Icon(
//                           icon,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Text(
//                       text,
//                       style: TextStyle(
//                           fontSize: 24.sp,
//                           color: kConstantGrey,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'TTCommons-DemiBold'),
//                     ),
//                     const Spacer(),
//                     Icon(FontAwesomeIcons.arrowRight,
//                         size: 14.sp, color: kConstantGrey),
//                     SizedBox(width: 16.w),
//                   ],
//                 ),
//               ),
//             )
//           : Container(
//               height: 80.h,
//               width: 326.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.sp),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding:
//                     EdgeInsets.only(left: 16.sp, top: 12.sp, bottom: 12.sp),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: color,
//                       radius: 28.sp,
//                       child: Center(
//                         child: Icon(
//                           icon,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Text(
//                       text,
//                       style: TextStyle(
//                           fontSize: 24.sp,
//                           color: kConstantGrey,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'TTCommons-DemiBold'),
//                     ),
//                     const Spacer(),
//                     Icon(FontAwesomeIcons.arrowRight,
//                         size: 14.sp, color: kConstantGrey),
//                     SizedBox(width: 16.w),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
//
// class ToolkitCard extends StatelessWidget {
//   const ToolkitCard({
//     required this.cardText,
//     required this.imageSourceString,
//     required this.topicName,
//     required this.type,
//     required this.tiletype,
//     required this.duration,
//     this.toolkit_typeid,
//     this.isSaved,
//   });
//
//   final String type;
//   final String topicName;
//   final String cardText;
//   final String imageSourceString;
//   final String tiletype;
//   final String duration;
//   final int? toolkit_typeid;
//   final bool? isSaved;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 12.h),
//       borderOnForeground: true,
//       elevation: 2.sp,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.sp),
//       ),
//       color: kConstantPaleWhite,
//       child: InkWell(
//         onTap: () {
//           Get.to(() => const ToolKitDetailsScreen(),
//               arguments: [toolkit_typeid]);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.sp),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: ClipRRect(
//                   child: Image.network(
//                     imageSourceString,
//                     height: 200.h,
//                     width: double.infinity,
//                     fit: BoxFit.fitWidth,
//                   ),
//                   borderRadius: BorderRadius.circular(8.sp),
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               Text(
//                 type,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: kBlueGreyTextColor,
//                   letterSpacing: 0.6.sp,
//                   fontSize: 12.sp,
//                   fontFamily: "TTCommons-DemiBold",
//                 ),
//               ),
//               SizedBox(height: 4.h),
//               Text(
//                 topicName,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: kBlueGreyTextColor,
//                   fontSize: 24.sp,
//                   fontFamily: "TTCommons-Regular",
//                 ),
//               ),
//               SizedBox(height: 4.h),
//               Text(
//                 cardText,
//                 style: TextStyle(
//                   color: kBlueGreyTextColor,
//                   fontSize: 16.sp,
//                   fontFamily: "TTCommons-Regular",
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(height: 25.h),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.access_time_filled,
//                     size: 16.sp,
//                   ),
//                   SizedBox(width: 4.w),
//                   Text(
//                     duration,
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       color: kBlueGreyTextColor,
//                       fontFamily: "TTCommons-Regular",
//                     ),
//                   ),
//                   SizedBox(width: 4.w),
//                   Icon(
//                     Icons.fiber_manual_record,
//                     size: 7.sp,
//                   ),
//                   SizedBox(width: 4.w),
//                   Text(
//                     tiletype,
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       color: kBlueGreyTextColor,
//                       fontFamily: "TTCommons-Regular",
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       onPressed: () {
//                         if (isSaved == true) {
//                           ToolKitPageUniversalServices.apiUnSaveToolKit(
//                               toolkit_typeid!);
//                         } else {
//                           ToolKitPageUniversalServices.apiSaveToolKit(
//                               TokenServices.token, toolkit_typeid!);
//                         }
//                       },
//                       icon: Icon(
//                         Icons.bookmark,
//                         color: isSaved == true ? Colors.yellow : Colors.black45,
//                         size: 18.sp,
//                       )),
//                   SizedBox(width: 16.w),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_details_screen/tool_kit_details_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/tool_kit_page_universal_services.dart';

import '../../constants.dart';

class ToolKitAppBar extends StatelessWidget {
  const ToolKitAppBar({required this.color, required this.icon});

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      centerTitle: false,
      toolbarHeight: 60.h,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Icon(
        icon,
        size: 20.sp,
      ),
      title: Text("Forms",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "TTCommons-Bold")),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white70,
          child: Container(
            height: 35.w,
            width: 35.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset("images/navigator2.png"),
          ),
        ),
        SizedBox(width: 12.sp)
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({required this.color, required this.icon});

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      centerTitle: false,
      toolbarHeight: 60.h,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Icon(
        icon,
        size: 20.sp,
      ),
      title: Text("Forms",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "TTCommons-Bold")),
      actions: [
        Container(
          height: 35.w,
          width: 35.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset("images/navigator2.png"),
        ),
        SizedBox(width: 12.sp)
      ],
    );
  }
}

class ToolKitBarButtons extends StatelessWidget {
  const ToolKitBarButtons(
      {required this.icon,
      required this.text,
      // required this.color,
      required this.tap});

  // final Color color;
  final String text;
  final IconData icon;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: MediaQuery.of(context).size.width > 900
          ? Container(
              width: double.infinity,
              height: 80.h,
              decoration: BoxDecoration(
                border: Border.all(color: ShadowColor),
                borderRadius: BorderRadius.circular(8.sp),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.sp, top: 12.sp, bottom: 12.sp),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28.sp,
                      child: Center(
                        child: Icon(
                          icon,
                          color: kConstantPurple,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 24.sp, color: kConstantGrey, fontWeight: FontWeight.bold, fontFamily: 'TTCommons-DemiBold'),
                    ),
                    const Spacer(),
                    Icon(CupertinoIcons.forward, size: 14.sp, color: kConstantGrey),
                    SizedBox(width: 16.w),
                  ],
                ),
              ),
            )
          : Container(
              width: double.infinity,
              height: 65.h,
              padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
              decoration: BoxDecoration(
                border: Border.all(color: ShadowColor),
                borderRadius: BorderRadius.circular(8.sp),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    SizedBox(width: 12.w),
                    Center(child: Icon(icon, color: kConstantPurple)),
                    SizedBox(width: 25.w),
                    Text(text, style: TextStyle(fontSize: 20.sp, color: kConstantGrey, fontFamily: 'TTCommons-DemiBold')),
                    const Spacer(),
                    const Icon(CupertinoIcons.forward, color: kConstantGrey),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
            ),
    );
  }
}

class ToolkitCard extends StatelessWidget {
  const ToolkitCard({
    required this.cardText,
    required this.imageSourceString,
    required this.topicName,
    required this.type,
    required this.tiletype,
    required this.duration,
    this.toolkit_typeid,
    this.isSaved,
  });

  final String type;
  final String topicName;
  final String cardText;
  final String imageSourceString;
  final String tiletype;
  final String duration;
  final int? toolkit_typeid;
  final bool? isSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ShadowColor),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: InkWell(
        onTap: () {
          Get.to(() => const ToolKitDetailsScreen(), arguments: [toolkit_typeid]);
        },
        child: Padding(
          padding: EdgeInsets.all(5.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),

                  // color: SteelGrey1,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: SteelGrey,
                      child: Icon(
                          tiletype == "Video"
                              ? Icons.tv
                              : tiletype == "Article"
                                  ? Icons.article_outlined
                                  : CupertinoIcons.link,
                          color: kConstantPurple),
                      radius: 28.sp,
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topicName,
                            style: TextStyle(
                                fontSize: 17.sp, color: kConstantGrey, fontWeight: FontWeight.w500, fontFamily: 'TTCommons-Bold'),
                          ),
                          Row(
                            children: [
                              Text(tiletype, style: const TextStyle(color: Colors.black54, fontFamily: 'TTCommons-DemiBold')),
                              const Text(" I ", style: TextStyle(color: Colors.black, fontFamily: 'TTCommons-DemiBold')),
                              Text(duration, style: const TextStyle(color: Colors.black54, fontFamily: 'TTCommons-DemiBold'))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () {
                            ToolKitPageUniversalServices.toolKitSaveUnSaveFunction(toolkit_typeid!, isSaved ?? false);
                          },
                          icon: isSaved == true
                              ? Icon(
                                  Icons.bookmark,
                                  color: Colors.black45,
                                  size: 18.sp,
                                )
                              : Icon(
                                  Icons.bookmark_border,
                                  color: Colors.black45,
                                  size: 18.sp,
                                )),
                    ),
                    SizedBox(width: 5.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//   child: ClipRRect(
//     child: Image.network(
//       imageSourceString,
//       fit: BoxFit.fitWidth,
//     ),
//     borderRadius: BorderRadius.circular(8.sp),
//   ),
// ),
// SizedBox(height: 16.h),
// Text(
//   type,
//   textAlign: TextAlign.left,
//   style: TextStyle(
//     color: kBlueGreyTextColor,
//     letterSpacing: 0.6.sp,
//     fontSize: 12.sp,
//     fontFamily: "TTCommons-DemiBold",
//   ),
// ),
// SizedBox(height: 4.h),
// Row(
//   children: [
//     Expanded(
//       child: Container(
//         child: Text(
//           topicName,
//           textAlign: TextAlign.left,
//           style: TextStyle(
//             color: kBlueGreyTextColor,
//             fontSize: 24.sp,
//             fontFamily: "TTCommons-Regular",
//           ),
//         ),
//       ),
//     ),
//     IconButton(
//         onPressed: () {
//           ToolKitPageUniversalServices.toolKitSaveUnSaveFunction(
//               toolkit_typeid!, isSaved ?? false);
//         },
//         icon: isSaved == true
//             ? Icon(
//                 Icons.bookmark,
//                 color: Colors.black45,
//                 size: 18.sp,
//               )
//             : Icon(
//                 Icons.bookmark_border,
//                 color: Colors.black45,
//                 size: 18.sp,
//               )),
//   ],
// ),
// SizedBox(height: 4.h),
// Text(
//   cardText,
//   style: TextStyle(
//     color: kBlueGreyTextColor,
//     fontSize: 16.sp,
//     fontFamily: "TTCommons-Regular",
//   ),
//   textAlign: TextAlign.left,
// ),
// SizedBox(height: 25.h),
// Row(
//   children: [
//     // Icon(
//     //   Icons.access_time_filled,
//     //   size: 16.sp,
//     // ),
//     SizedBox(width: 4.w),
//     Text(
//       tiletype,
//       style: TextStyle(
//           color: kConstantPurple,
//           fontFamily: 'TTCommons-DemiBold'),
//     ),
//
//     SizedBox(width: 4.w),
//     Icon(
//       Icons.fiber_manual_record,
//       size: 7.sp,
//     ),
//     SizedBox(width: 4.w),
//     Text(
//       duration,
//       style: TextStyle(
//           color: Colors.black54,
//           fontFamily: 'TTCommons-DemiBold'),
//     ),
//     const Spacer(),
//     SizedBox(width: 16.w),
//     // Icon(
//     //   Icons.more_horiz,
//     //   color: kBlueGreyTextColor,
//     //   size: 18.sp,
//     // ),
//   ],
// ),

class ToolkitPagesAppBar extends StatelessWidget {
  const ToolkitPagesAppBar({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GoBack(),
        SizedBox(width: 5.w),
        Text(
          type,
          style: TextStyle(color: kBlueGreyTextColor, fontSize: 24.sp),
        ),
      ],
    );
  }
}
