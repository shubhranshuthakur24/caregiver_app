// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:givershealths/care_giver_app/screens/constants.dart';
//
// class ResourcePageView extends StatefulWidget {
//   const ResourcePageView({Key? key}) : super(key: key);
//
//   @override
//   _ResourcePageViewState createState() => _ResourcePageViewState();
// }
//
// class _ResourcePageViewState extends State<ResourcePageView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Respite",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Container(
//         decoration: kConstantGradientNew(),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(left: 24.sp, right: 24.sp, top: 24.sp),
//             child: SingleChildScrollView(
//               child: Container(
//                 child: Column(
//                   children: [
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                     ToolKitBarButtons(
//                       text: 'TEXT',
//                       tap: () {},
//                       icon: Icons.all_inclusive_sharp,
//                     ),
//                     SizedBox(height: 10.h),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ToolKitBarButtons extends StatelessWidget {
//   const ToolKitBarButtons({required this.icon, required this.text, required this.tap});
//
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
//                 padding: EdgeInsets.only(left: 16.sp, top: 12.sp, bottom: 12.sp),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.black12,
//                       radius: 28.sp,
//                       child: Center(
//                         child: Icon(
//                           icon,
//                           color: kConstantPurple,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Text(
//                       text,
//                       style: TextStyle(
//                           fontSize: 24.sp, color: kConstantGrey, fontWeight: FontWeight.bold, fontFamily: 'TTCommons-DemiBold'),
//                     ),
//                     const Spacer(),
//                     Icon(FontAwesomeIcons.arrowRight, size: 14.sp, color: kConstantGrey),
//                     SizedBox(width: 16.w),
//                   ],
//                 ),
//               ),
//             )
//           : Container(
//               width: 326.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.sp),
//                 color: SteelGrey1,
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(left: 16.sp, top: 12.sp, bottom: 12.sp),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       radius: 28.sp,
//                       child: Center(
//                         child: Icon(
//                           icon,
//                           color: kConstantPurple,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           text,
//                           style: TextStyle(
//                               fontSize: 24.sp,
//                               color: kConstantGrey,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'TTCommons-DemiBold'),
//                         ),
//                         Row(
//                           children: [
//                             Text("Audio", style: TextStyle(color: kConstantPurple, fontFamily: 'TTCommons-DemiBold')),
//                             Text(" I ", style: TextStyle(color: Colors.black, fontFamily: 'TTCommons-DemiBold')),
//                             Text("20 min", style: TextStyle(color: Colors.black54, fontFamily: 'TTCommons-DemiBold'))
//                           ],
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Icon(FontAwesomeIcons.arrowRight, size: 14.sp, color: kConstantGrey),
//                     SizedBox(width: 16.w),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
