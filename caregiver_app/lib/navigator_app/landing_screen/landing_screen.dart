// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:navigator/Pages/login_Screen/login_screen.dart';
// import 'package:navigator/Pages/login_Screen/login_screen_widgets.dart';
// import 'package:navigator/Pages/signup_screen/signup_screen.dart';
// import 'package:navigator/Pages/universal_widgets/universal_widgets.dart';
//
// import '../constants.dart';
//
// class LandingScreen extends StatefulWidget {
//   const LandingScreen({Key? key}) : super(key: key);
//
//   @override
//   _LandingScreenState createState() => _LandingScreenState();
// }
//
// class _LandingScreenState extends State<LandingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 925.h,
//         width: 375.w,
//         decoration: kConstantGradient(),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(right: 24.sp, left: 24.sp, top: 93.sp),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Welcome to GiversHealth',
//                       style: kConstantBigTextStyle(),
//                     ),
//                     SizedBox(height: 16.h),
//                     Text(
//                         'Find resources, expert guidance, and community support through your caregiving journey.',
//                         style: kConstantSmallTextStyle()),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   MaterialButton(
//                     elevation: 0,
//                     height: 50.h,
//                     minWidth: 326.w,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         side: BorderSide(color: kConstantPurple, width: 0.8.w)),
//                     color: kConstantPurple,
//                     child: Text(
//                       'CREATE ACCOUNT',
//                       style: kButtonTextStyle(),
//                     ),
//                     onPressed: () {
//                       Get.to(const SignUpScreen());
//                     },
//                   ),
//                   SizedBox(height: 16.h),
//                   MaterialButton(
//                     elevation: 0,
//                     height: 50.h,
//                     minWidth: 326.w,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                         side: BorderSide(color: kConstantPurple, width: 0.8.w)),
//                     color: kConstantPurple,
//                     child: Text(
//                       'LOG IN',
//                       style: kButtonTextStyle(),
//                     ),
//                     onPressed: () {
//                       Get.to(const LogInScreen());
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 36.h)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
