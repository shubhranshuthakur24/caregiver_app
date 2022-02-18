// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:givershealths/care_giver_app/screens/constants.dart';
//
// class CareGiverDataScreen extends StatefulWidget {
//   const CareGiverDataScreen({Key? key}) : super(key: key);
//
//   @override
//   _CareGiverDataScreenState createState() => _CareGiverDataScreenState();
// }
//
// class _CareGiverDataScreenState extends State<CareGiverDataScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: SteelGrey1,
//       appBar: AppBar(
//         backgroundColor: SteelGrey1,
//         elevation: 0,
//         centerTitle: true,
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "Done",
//                 style: TextStyle(color: kConstantPurple, fontSize: 16.sp),
//               )),
//         ],
//         title: Text(
//           "Profile",
//           style: TextStyle(color: Colors.black87, fontSize: 16.sp, fontWeight: FontWeight.w800),
//         ),
//         leading: TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text(
//               "Back",
//               style: TextStyle(color: kConstantPurple, fontSize: 16.sp),
//             )),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Divider(
//                 color: Colors.grey.shade200,
//                 thickness: 10.sp,
//               ),
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Container(
//                     height: 120.h,
//                     width: 120.w,
//                     decoration: BoxDecoration(shape: BoxShape.circle, color: kConstantLightPurple),
//                     child: Center(
//                         child: Text(
//                       "AA",
//                       style: TextStyle(color: SteelGrey1, fontSize: 26.sp),
//                     )),
//                   ),
//                   Positioned(
//                       bottom: -10,
//                       right: 5,
//                       child: Container(
//                         height: 40.h,
//                         width: 40.w,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: kConstantLightPurple,
//                             boxShadow: [BoxShadow(color: SteelGrey1, spreadRadius: 2.sp)]),
//                         child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               CupertinoIcons.camera,
//                               color: SteelGrey1,
//                               //size: 36.sp,
//                             )),
//                       ))
//                 ],
//               ),
//               ProfileTextFields(type: "NAME"),
//               ProfileTextFields(type: "PHONE"),
//               ProfileTextFields(type: "EMAIL"),
//               ProfileTextFields(type: "RELATIONSHIP TO CARE RECIPIENT"),
//               ProfileTextFields(type: "HOME LOCATION"),
//               ProfileTextFields(type: "DATE OF BIRTH"),
//               ProfileTextFields(type: "LIVING SITUATION"),
//               ProfileTextFields(type: "EMPLOYMENT STATUS"),
//               ProfileTextFields(type: "ADDITIONAL INFORMATION"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileTextFields extends StatelessWidget {
//   const ProfileTextFields({Key? key, required this.type}) : super(key: key);
//   final String type;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
//       margin: EdgeInsets.only(bottom: 10.sp),
//       child: TextField(
//         cursorColor: kConstantPurple,
//         decoration: InputDecoration(
//             labelText: type,
//             labelStyle: TextStyle(color: Colors.grey, fontFamily: 'TTCommons-DemiBold'),
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             border: UnderlineInputBorder(borderSide: BorderSide(color: kConstantPurple)),
//             focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kConstantPurple)),
//             enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300))),
//       ),
//     );
//   }
// }
