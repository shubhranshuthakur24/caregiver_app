import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/calander/calendar_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/homepage_widgets.dart';

import '../../../../constants.dart';
import 'home_page_services.dart';
import 'home_page_widget/home_page_new_widget.dart';
import 'home_page_widget/my_task_card_widget.dart';
import 'homepage_widgets.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late HomePageServices homePageServicesController;

  @override
  void initState() {
    super.initState();
    HomePageServices.apiGetCareGiverDetails(TokenServices.token);
    HomePageServices.editingController = TextEditingController(text: HomePageServices.initialText);
    CalendarServices.screenNameWhereCalanderUsed = "HomePage";
    homePageServicesController = Get.put(HomePageServices());
    // ProfilePicFetchFromFirebase.profilePicFetch();
  }

  @override
  void dispose() {
    HomePageServices.editingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: SteelGrey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: EdgeInsets.only(top: 15.sp),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      SizedBox(width: 20.sp),
                      const Spacer(),
                      const NotificationWidget(),
                      SizedBox(width: 15.w),
                      Obx(() {
                        return HomePageServices.data.isEmpty
                            ? showSpinkitCircle()
                            : UserImageWidget(HomePageServices.data[0].cgProfilePic);
                      }),
                      SizedBox(width: 15.w),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),

                        Text(
                          "MY MANTRA",
                          style: TextStyle(
                            letterSpacing: 0.7.sp,
                            fontSize: 13.sp,
                            color: kBlueGreyTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'TTCommons-Bold',
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Obx(() {
                          return HomePageServices.data.isEmpty
                              ? SizedBox(height: 88.h, child: showSpinkitCircle())
                              : EditableText(
                                  readOnly: true,
                                  controller: TextEditingController(text: HomePageServices.data[0].cgMantra),
                                  maxLines: 2,
                                  onSubmitted: (newValue) {
                                    setState(() {
                                      HomePageServices.initialText = newValue;
                                      HomePageServices.isEditingText = false;
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  focusNode: FocusNode(),
                                  style: TextStyle(
                                      color: kBlueGreyTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'TTCommons-DemiBold',
                                      fontSize: 25.sp),
                                  cursorColor: Colors.white,
                                  backgroundCursorColor: Colors.white);
                        }),

                        SizedBox(
                          height: 26.h,
                        ),

                        // Navigator Card
                        Obx(() {
                          return HomePageServices.data.isEmpty
                              ? SizedBox(height: 92.h, child: showSpinkitCircle())
                              : HomePageServices.data[0].navigatorData.slotStartTime == ""
                                  ? NavigatorCardWidgetSheduleMeetingNew(
                                      navProileUrl: HomePageServices.data[0].navigatorData.navProfilePic,
                                      name: HomePageServices.data[0].navigatorData.navFirstName +
                                          " " +
                                          HomePageServices.data[0].navigatorData.navLastName,
                                      city: HomePageServices.data[0].navigatorData.city,
                                      state: HomePageServices.data[0].navigatorData.state,
                                      navigatorid: HomePageServices.data[0].navigatorData.navigatorid,
                                    )
                                  : CancelResheduleMeetingNavigatorCardWidget(
                                      navProileUrl: HomePageServices.data[0].navigatorData.navProfilePic,
                                      name: HomePageServices.data[0].navigatorData.navFirstName +
                                          " " +
                                          HomePageServices.data[0].navigatorData.navLastName,
                                      city: HomePageServices.data[0].navigatorData.city,
                                      state: HomePageServices.data[0].navigatorData.state,
                                      navigatorid: HomePageServices.data[0].navigatorData.navigatorid,
                                    );
                        }),
                        SizedBox(height: 30.h),

                        const MyTaskRowWithButton(),
                        SizedBox(height: 15.h),
                        SizedBox(
                          child: Obx(() {
                            return HomePageServices.data.isEmpty
                                ? SizedBox(height: 240.h, child: showSpinkitCircle(color: kConstantPurple))
                                : SizedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(child: MyTasks()),
                                        MyTasksCardWidget(),
                                        // Container(
                                        //   height: 250.h,
                                        //   constraints:
                                        //       BoxConstraints(minHeight: 90.h),
                                        //   child: Padding(
                                        //     padding: EdgeInsets.only(
                                        //         left: 34.sp,
                                        //         right: 29.sp,
                                        //         top: 16.sp),
                                        //     // child: Column(
                                        //     //   children: [
                                        //     //     const CreateTaskWidget(),
                                        //     //     SizedBox(height: 26.sp),
                                        //     //   ],
                                        //     // ),
                                        //   ),
                                        // )
                                        SizedBox(height: 26.sp),
                                      ],
                                    ),
                                  );
                          }),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          // bottomNavigationBar: const UniversalBottomAppBarWidget(),
        ),
        onWillPop: () async {
          homePageServicesController.doubleClickAppExit();
          return false;
        });
  }
}
