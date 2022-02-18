import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/my_loved_one_screen/my_loved_one_update_screen/my_loved_one_update_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_services.dart';

import '../../../constants.dart';
import 'my_loved_one_sevices.dart';
import 'my_loved_ones_widgets.dart';

class MyLovedOnesScreen extends StatefulWidget {
  const MyLovedOnesScreen({Key? key}) : super(key: key);

  @override
  _MyLovedOnesScreenState createState() => _MyLovedOnesScreenState();
}

class _MyLovedOnesScreenState extends State<MyLovedOnesScreen> {
  late MyLovedOneServices _myLovedOneServicesController;

  @override
  void initState() {
    // TODO: implement initState
    MyLovedOneServices.loved_one_id = Get.arguments[0];
    _myLovedOneServicesController = Get.put(MyLovedOneServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Container(
            color: const Color(0xFFfaf9f7),
            height: 1573.h,
            width: 375.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 375.w,
                    height: 240.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // colors: [Color(0xffb599CD3), Color(0xffb469BD1)],
                      colors: [Color(0xffb469BD1), Color(0xffb469BD1)],
                    )),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180.h, left: 19.h),
                      child: InkWell(
                        onTap: () {
                          _myLovedOneServicesController.OnBackPressFunctionality();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                              size: 15.0,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 212.h,
                        width: 375.w,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // colors: [Color(0xffb599CD3), Color(0xffb469BD1)],
                          colors: [Color(0xffb469BD1), Color(0xffb599CD3)],
                        )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Text(
                                "My Loved one",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Row of photo and persons data.
                      Obx(() {
                        return _myLovedOneServicesController.data.isEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: 80.h),
                                child: showSpinkitRing(),
                              )
                            : Row(
                                children: [
                                  SizedBox(width: 14.w),
                                  Align(
                                    heightFactor: 1.5,
                                    alignment: Alignment(-.84.sp, 2.5.sp),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => MyLovedOneUpdateScreen());
                                        // _myLovedOneServicesController.uploadImage();
                                      },
                                      child: lovedOneProfileUrlUniversal.value != ""
                                          ? CircleAvatar(
                                              radius: 60.r,
                                              backgroundImage: NetworkImage(lovedOneProfileUrlUniversal.value),
                                            )
                                          : nameImage(name: _myLovedOneServicesController.data[0].firstName),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 130.h),
                                      Text(
                                        _myLovedOneServicesController.data[0].firstName.toString() +
                                            " " +
                                            _myLovedOneServicesController.data[0].lastName.toString(),
                                        style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Age " +
                                            UserBioServices.ageCalculator(_myLovedOneServicesController.data[0].dob) +
                                            ", " +
                                            _myLovedOneServicesController.data[0].gender,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'TTCommons-Medium'),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        _myLovedOneServicesController.data[0].city.toString() +
                                            " " +
                                            _myLovedOneServicesController.data[0].state.toString(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'TTCommons-Medium'),
                                      )
                                    ],
                                  )
                                ],
                              );
                      }),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Obx(() {
                    return _myLovedOneServicesController.data.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: showSpinkitRing(color: kConstantPurple),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 19.sp, right: 19.sp),
                                child: LightBlueCard(
                                  primaryInsuranceName: _myLovedOneServicesController.data[0].primaryInsurance.toString(),
                                  secondaryInsuranceName: _myLovedOneServicesController.data[0].secondaryInsurance.toString(),
                                  primaryCarePhysician: _myLovedOneServicesController.data[0].primaryCarePhysician.toString(),
                                  hospitalOfChoice: 'USFC Medical Center',
                                ),
                              ),
                              SizedBox(height: 28.h),
                              MyLovedOneDetailsButtons(
                                questions: "Contact Detaills",
                                icon: FontAwesomeIcons.phoneAlt,
                                iconColor: Colors.grey,
                                dataText: _myLovedOneServicesController.data[0].phone.toString(),
                              ),
                              SizedBox(height: 28.h),
                              MyLovedOneDetailsButtons(
                                questions: "Medical Diagonosis",
                                icon: FontAwesomeIcons.notesMedical,
                                iconColor: Colors.grey,
                                dataText: _myLovedOneServicesController.getDiseaseData(),
                              ),
                              SizedBox(height: 28.h),
                              const MyLovedOneDetailsButtons(
                                questions: "Known Allergy",
                                icon: FontAwesomeIcons.headSideMask,
                                iconColor: kConstantGrey,
                                dataText: 'Gluten Allergies, Pollen',
                              ),
                              SizedBox(height: 28.h),
                              SizedBox(height: 28.h),
                            ],
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          _myLovedOneServicesController.OnBackPressFunctionality();
          return false;
        });
  }
}

class MedicationListViewWidget extends StatelessWidget {
  MedicationListViewWidget({required this.dosage, required this.medicineName, required this.timing});

  final String medicineName;
  final String dosage;
  final String timing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          medicineName,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: kConstantPurple),
        ),
        Divider(height: 10.h),
        Text(dosage, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: kConstantPurple)),
        Divider(height: 10.h),
        Text(timing, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: kConstantPurple))
      ],
    );
  }
}

class ImageCircleAvatar extends StatelessWidget {
  String profileUrl;

  ImageCircleAvatar(this.profileUrl);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 120.w,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 60.sp,
        child: CircleAvatar(
          radius: 57.sp,
          backgroundImage: NetworkImage(profileUrl),
        ),
      ),
    );
  }
}
