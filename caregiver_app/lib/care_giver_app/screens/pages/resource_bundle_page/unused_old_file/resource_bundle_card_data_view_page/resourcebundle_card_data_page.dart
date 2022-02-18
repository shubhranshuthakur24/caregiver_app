// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:givershealths/SRC/url_launcher/url_launcher.dart';
// import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/unused_old_file/resource_bundle_card_data_view_page/resourcebundle_card_data_page_services.dart';
//
// import '../../../../constants.dart';
//
// class ResourceBundleCardDataViewPage extends StatefulWidget {
//   const ResourceBundleCardDataViewPage({Key? key}) : super(key: key);
//
//   @override
//   _ResourceBundleCardDataViewPageState createState() => _ResourceBundleCardDataViewPageState();
// }
//
// class _ResourceBundleCardDataViewPageState extends State<ResourceBundleCardDataViewPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     ResourceBundleCardDataPageServices.resourceid = Get.arguments[0];
//     final controller = Get.put(ResourceBundleCardDataPageServices());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kConstantPaleWhite,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: 375.w,
//                   height: 500.h,
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Obx(() {
//                         return ResourceBundleCardDataPageServices.banner_pic_url.isEmpty
//                             ? Container(
//                                 child: showSpinkitRing(color: kConstantPurple),
//                               )
//                             : Container(
//                                 height: 450.h,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image: NetworkImage(
//                                         ResourceBundleCardDataPageServices.banner_pic_url.value,
//                                       ),
//                                       colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.darken),
//                                       fit: BoxFit.cover),
//                                 ),
//                                 child: SizedBox(
//                                   child: Column(
//                                     children: [
//                                       SizedBox(height: 200.h),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         children: [
//                                           IconButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               icon: const Icon(
//                                                 CupertinoIcons.back,
//                                                 color: Colors.white,
//                                               )),
//                                           const Text(
//                                             "Back",
//                                             style: TextStyle(color: Colors.white),
//                                           )
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         width: 330.w,
//                                         child: Text(
//                                           ResourceBundleCardDataPageServices.title.value,
//                                           style: TextStyle(fontSize: 36.sp, color: Colors.white, fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                       }),
//                       Obx(() {
//                         return ResourceBundleCardDataPageServices.banner_pic_url.isEmpty
//                             ? showSpinkitRing(color: kConstantPurple)
//                             : Positioned(
//                                 top: 400.sp,
//                                 left: 25.sp,
//                                 right: 25.sp,
//                                 child: Container(
//                                   width: 330.w,
//                                   height: 110.h,
//                                   decoration:
//                                       BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.sp))),
//                                   child: Padding(
//                                     padding: EdgeInsets.all(14.sp),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Icon(
//                                               Icons.more_time,
//                                               color: kConstantGrey,
//                                               size: 16.sp,
//                                             ),
//                                             Text(
//                                               "Last Viewed Just Now",
//                                               textAlign: TextAlign.left,
//                                               style: TextStyle(color: kConstantGrey, fontSize: 16.sp),
//                                             )
//                                           ],
//                                         ),
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             SizedBox(
//                                               width: 140.w,
//                                               child: OutlinedButton.icon(
//                                                   onPressed: () {
//                                                     UrlLauncher.launchURL(ResourceBundleCardDataPageServices.website_url.value);
//                                                   },
//                                                   icon: Icon(
//                                                     CupertinoIcons.link,
//                                                     color: kConstantPurple,
//                                                     size: 16.sp,
//                                                   ),
//                                                   label: Text(
//                                                     "Visit",
//                                                     style: TextStyle(color: kConstantPurple, fontSize: 16.sp),
//                                                   ),
//                                                   style: OutlinedButton.styleFrom(
//                                                     shape: RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.circular(18.0),
//                                                     ),
//                                                     side: BorderSide(width: 2.sp, color: kConstantPurple),
//                                                   )),
//                                             ),
//                                             SizedBox(
//                                               width: 140.w,
//                                               child: OutlinedButton.icon(
//                                                   onPressed: () {
//                                                     ResourceBundleCardDataPageServices.saveUnSaveFunction();
//                                                   },
//                                                   icon: Icon(
//                                                     CupertinoIcons.bookmark,
//                                                     color: ResourceBundleCardDataPageServices.isSaved == false
//                                                         ? kBorderGrey
//                                                         : kConstantPurple,
//                                                     size: 16.sp,
//                                                   ),
//                                                   label: Text(
//                                                     "Save",
//                                                     style: TextStyle(
//                                                         color: ResourceBundleCardDataPageServices.isSaved == false
//                                                             ? kBorderGrey
//                                                             : kConstantPurple,
//                                                         fontSize: 16.sp),
//                                                   ),
//                                                   style: OutlinedButton.styleFrom(
//                                                     shape: RoundedRectangleBorder(
//                                                       borderRadius: BorderRadius.circular(18.0),
//                                                     ),
//                                                     side: BorderSide(
//                                                         width: 2.sp,
//                                                         color: ResourceBundleCardDataPageServices.isSaved == false
//                                                             ? kBorderGrey
//                                                             : kConstantPurple),
//                                                   )),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                       }),
//                     ],
//                   ),
//                 ),
//                 Obx(() {
//                   return ResourceBundleCardDataPageServices.banner_pic_url.isEmpty
//                       ? showSpinkitRing(color: kConstantPurple)
//                       : Padding(
//                           padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
//                           child: Column(
//                             children: [
//                               SizedBox(height: 24.h),
//                               Text(
//                                 ResourceBundleCardDataPageServices.info.value,
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                   fontFamily: "TTCommons-Regular",
//                                   fontSize: 20.sp,
//                                 ),
//                               ),
//                               SizedBox(height: 24.h),
//                               Card(
//                                 child: Container(
//                                   color: Colors.white,
//                                   width: double.infinity,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(16.sp),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Cost",
//                                           style: TextStyle(
//                                               fontSize: 18.sp, color: kConstantPurple, fontFamily: "TTCommons-DemiBold"),
//                                         ),
//                                         SizedBox(height: 12.h),
//                                         Text(
//                                           ResourceBundleCardDataPageServices.info.value,
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                             fontFamily: "TTCommons-Regular",
//                                             fontSize: 20.sp,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 24.h),
//                               Card(
//                                 color: Colors.white,
//                                 child: SizedBox(
//                                   width: double.infinity,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(16.sp),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Eligibility",
//                                           style: TextStyle(
//                                               fontSize: 18.sp, color: kConstantPurple, fontFamily: "TTCommons-DemiBold"),
//                                         ),
//                                         SizedBox(height: 12.h),
//                                         Text(
//                                             "Priority for Medicaid+Medicare members, but available for anyone 55+ within the service area.  Call to confirm eligibility.",
//                                             style: TextStyle(
//                                                 fontSize: 18.sp, color: kBlueGreyTextColor, fontFamily: "TTCommons-Regular"))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: Card(
//                                   color: Colors.white,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(16.sp),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Contact",
//                                           textAlign: TextAlign.left,
//                                           style: TextStyle(
//                                               fontSize: 18.sp, color: kConstantPurple, fontFamily: "TTCommons-DemiBold"),
//                                         ),
//                                         SizedBox(
//                                             width: double.infinity,
//                                             child: OutlinedButton.icon(
//                                               onPressed: () {
//                                                 UrlLauncher.phoneNumberLaunch(ResourceBundleCardDataPageServices.phone.value);
//                                               },
//                                               icon: const Icon(
//                                                 CupertinoIcons.phone,
//                                                 color: kConstantPurple,
//                                               ),
//                                               label: Text(
//                                                 ResourceBundleCardDataPageServices.phone.value,
//                                                 style: TextStyle(fontSize: 14.sp, color: kConstantPurple),
//                                               ),
//                                               style: OutlinedButton.styleFrom(
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.circular(18.0),
//                                                 ),
//                                                 side: BorderSide(width: 2.sp, color: kConstantPurple),
//                                               ),
//                                             )),
//                                         SizedBox(
//                                           width: double.infinity,
//                                           child: OutlinedButton.icon(
//                                             onPressed: () {
//                                               UrlLauncher.emailLauncher(ResourceBundleCardDataPageServices.email.value);
//                                             },
//                                             icon: const Icon(
//                                               CupertinoIcons.link,
//                                               color: kConstantPurple,
//                                             ),
//                                             label: Text(
//                                               ResourceBundleCardDataPageServices.email.value,
//                                               style: TextStyle(fontSize: 14.sp, color: kConstantPurple),
//                                             ),
//                                             style: OutlinedButton.styleFrom(
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(18.0),
//                                               ),
//                                               side: BorderSide(width: 2.sp, color: kConstantPurple),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 36.h),
//                             ],
//                           ),
//                         );
//                 })
//               ],
//             ),
//           ),
//         ));
//   }
// }
