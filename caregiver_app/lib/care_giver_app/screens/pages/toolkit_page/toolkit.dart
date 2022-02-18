import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_education/toolkit_education_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_faq/ToolkitFaqScreen.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_form/toolkit_form_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_saved/toolkit_saved_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit_universal_widgets.dart';

import '../../constants.dart';

class ToolKit extends StatefulWidget {
  const ToolKit({Key? key}) : super(key: key);

  @override
  _ToolKitState createState() => _ToolKitState();
}

class _ToolKitState extends State<ToolKit> {
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
      //   automaticallyImplyLeading: true,
      //   centerTitle: true,
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
                  height: 72.h,
                  constraints: BoxConstraints(maxHeight: 72.h, maxWidth: 327.w),
                  child: Text("Toolkit",
                      style: TextStyle(
                          fontSize: 36.sp, fontFamily: 'TTCommons-Bold', fontWeight: FontWeight.bold, color: kBlueGreyTextColor)),
                ),
                // SizedBox(height: 8.h),

                ToolKitBarButtons(
                  tap: () {
                    Get.to(const ToolkitEducationScreen(), arguments: ["Education", 1]);
                  },
                  // color: kToolKitPink,
                  text: 'Education',
                  icon: CupertinoIcons.book,
                ),
                SizedBox(height: 8.h),
                ToolKitBarButtons(
                  tap: () {
                    Get.to(const ToolKitFaqScreen());
                  },
                  // color: kToolKitBlue,
                  text: 'FAQs',
                  icon: CupertinoIcons.question,
                ),
                SizedBox(height: 8.h),
                ToolKitBarButtons(
                  tap: () {
                    Get.to(const ToolKitFormScreen());
                  },
                  // color: kToolKitGreen,
                  text: 'Forms',
                  icon: CupertinoIcons.list_number,
                ),
                SizedBox(height: 8.h),
                ToolKitBarButtons(
                  tap: () {
                    Get.to(const ToolkitSavedScreen(), arguments: ["Saved", 3]);
                  },
                  // color: kToolKitYellow,
                  text: 'Saved',
                  icon: CupertinoIcons.bookmark,
                ),
                SizedBox(height: 64.h),
                // Text(
                //   "Recommended For You",
                //   style: TextStyle(
                //       fontSize: 24.sp,
                //       color: Colors.white,
                //       fontFamily: "TTCommons-Regular"),
                // ),
                // const ToolkitCard(
                //   type: 'Legal',
                //   topicName: 'Advanced Healthcare Directive',
                //   cardText:
                //       'A legal document that specifies different actions to take if your loved one is no longer able to make decisions for themselves due to illness or incapacity. Has been shown to reduce unnecessary pain and stress for loved one and family members.',
                //   imageSourceString:
                //       'https://images.unsplash.com/photo-1564846824194-346b7871b855?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGRvY3VtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                //   tiletype: "link",
                //   duration: "2h",
                // ),
                // const ToolkitCard(
                //   type: "Behavior",
                //   topicName:
                //       'Managing Common Behavior Issues with Loved Ones',
                //   cardText:
                //       "This video from Geriatric Care Manager Leah discusses approaches to managing behavior issues such as refusing help, denying illness, verbal abuse, and other issues.",
                //   imageSourceString:
                //       "https://images.unsplash.com/photo-1511895426328-dc8714191300?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFtaWx5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
                //   tiletype: "Video Series",
                //   duration: "35m",
                // ),
                // const ToolkitCard(
                //   type: "Government Assistance",
                //   topicName: "Medicaid Application",
                //   cardText:
                //       "This tool will help you find the right form for your state and language preference to fill out a Medicaid application for your loved one. It will also help you populate the form and identify contacts for help if needed.",
                //   imageSourceString:
                //       "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGVhbXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
                //   tiletype: "Form",
                //   duration: "1h 32m",
                // ),
                // SizedBox(height: 36.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
