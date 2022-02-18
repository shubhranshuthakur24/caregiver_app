// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:givershealths/care_giver_app/screens/constants.dart';
//
// import '../../../../constants.dart';
//
// class NavigatorAndHelpersCard extends StatefulWidget {
//   NavigatorAndHelpersCard(
//       {Key? key,
//       this.age,
//       this.profileUrl,
//       required this.personsName,
//       required this.navigatorPlaceOfLivingOrAgeMyLLovedOne,
//       required this.myNavigatorOrLovedOne})
//       : super(key: key);
//   String? age;
//   final String personsName;
//   final String myNavigatorOrLovedOne;
//   late String navigatorPlaceOfLivingOrAgeMyLLovedOne;
//   final String? profileUrl;
//
//   @override
//   State<NavigatorAndHelpersCard> createState() => _NavigatorAndHelpersCardState();
// }
//
// class _NavigatorAndHelpersCardState extends State<NavigatorAndHelpersCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 148.w,
//       // width: 155.w,
//       // height: 195.h,
//       // margin: EdgeInsets.symmetric(horizontal: 5.w),
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(color: Colors.grey, blurRadius: 3.sp, offset: Offset(0, 5.sp)),
//         ],
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 17.h),
//           Text(
//             widget.myNavigatorOrLovedOne,
//             style: TextStyle(fontFamily: 'TTCommons', fontSize: 14.sp, fontWeight: FontWeight.bold, letterSpacing: 0.7.sp),
//           ),
//           SizedBox(height: 13.h),
//           widget.profileUrl.toString().isEmpty
//               ? nameImage(name: widget.personsName, width: 80, height: 80)
//               : CircleAvatar(
//                   backgroundImage: NetworkImage(widget.profileUrl.toString()),
//                   radius: 40.sp,
//                 ),
//           SizedBox(height: 11.h),
//           Text(
//             widget.personsName,
//             style: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color: kConstantPurple,
//             ),
//           ),
//           Text(
//             widget.navigatorPlaceOfLivingOrAgeMyLLovedOne,
//             style: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color: siginPageTextColor2,
//             ),
//           ),
//           Text(
//             widget.age ?? "",
//             style: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color: siginPageTextColor2,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class LovedOneCard extends StatefulWidget {
//   LovedOneCard(
//       {Key? key,
//       this.age,
//       required this.personsName,
//       required this.navigatorPlaceOfLivingOrAgeMyLLovedOne,
//       required this.myNavigatorOrLovedOne})
//       : super(key: key);
//   String? age;
//   final String personsName;
//   final String myNavigatorOrLovedOne;
//   late String navigatorPlaceOfLivingOrAgeMyLLovedOne;
//
//   @override
//   State<LovedOneCard> createState() => _LovedOneCardState();
// }
//
// class _LovedOneCardState extends State<LovedOneCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 148.w,
//       // height: 195.h,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(color: Colors.grey, blurRadius: 3.sp, offset: Offset(0, 5.sp)),
//         ],
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 17.h),
//           FittedBox(
//             child: Text(
//               widget.myNavigatorOrLovedOne,
//               style: TextStyle(fontFamily: 'TTCommons', fontSize: 14.sp, fontWeight: FontWeight.bold, letterSpacing: 0.7.sp),
//             ),
//           ),
//           SizedBox(height: 13.h),
//           Obx(() {
//             return lovedOneProfileUrlUniversal.value.isEmpty
//                 ? nameImage(name: widget.personsName, height: 80, width: 80)
//                 : CircleAvatar(
//                     backgroundImage: NetworkImage(
//                       lovedOneProfileUrlUniversal.value,
//                     ),
//                     radius: 40.sp,
//                   );
//           }),
//           SizedBox(height: 11.h),
//           FittedBox(
//             child: Text(
//               widget.personsName,
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w600,
//                 color: kConstantPurple,
//               ),
//             ),
//           ),
//           // FittedBox(
//           //   child: Text(
//           //     widget.navigatorPlaceOfLivingOrAgeMyLLovedOne,
//           //     style: TextStyle(
//           //       fontSize: 14.sp,
//           //       fontWeight: FontWeight.w600,
//           //       color: siginPageTextColor2,
//           //     ),
//           //   ),
//           // ),
//           FittedBox(
//             child: Text(
//               widget.age ?? "",
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w600,
//                 color: siginPageTextColor2,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 14.sp,
//           )
//         ],
//       ),
//     );
//   }
// }
