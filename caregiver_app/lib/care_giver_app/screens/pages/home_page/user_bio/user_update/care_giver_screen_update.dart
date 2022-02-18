import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_bio_services.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/user_bio/user_update/new_user_bio_screeen_services.dart';
import 'package:image_picker/image_picker.dart';

class CareGiverUpdateScreen extends StatefulWidget {
  const CareGiverUpdateScreen({Key? key}) : super(key: key);

  @override
  _CareGiverUpdateScreenState createState() => _CareGiverUpdateScreenState();
}

class _CareGiverUpdateScreenState extends State<CareGiverUpdateScreen> {
  NewUserBioScreenUpdateServices _newUserBioScreenServices = Get.put(NewUserBioScreenUpdateServices());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: SteelGrey,
          appBar: AppBar(
            backgroundColor: SteelGrey,
            elevation: 0,
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    _newUserBioScreenServices.cgProfileUpdate();
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w400, fontSize: 16.sp),
                  )),
            ],
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black87, fontSize: 15.sp, fontFamily: 'TTCommons-DemiBold', fontWeight: FontWeight.bold),
            ),
            leading: TextButton(
                onPressed: () {
                  if (_newUserBioScreenServices.HasAnythingChanged == true) {
                    UserBioServices.apiGetCgProfile(navigateMethod: "off");
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: kConstantPurple, fontSize: 16.sp, fontWeight: FontWeight.w400),
                )),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey.shade200,
                    thickness: 10.sp,
                  ),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(() {
                        return _newUserBioScreenServices.image != null || userProfileUrlUniversal.value.isNotEmpty
                            ? CircleAvatar(
                                radius: 60.r,
                                backgroundImage: _newUserBioScreenServices.image == null
                                    ? NetworkImage(
                                        userProfileUrlUniversal.value,
                                      )
                                    : FileImage(_newUserBioScreenServices.file) as ImageProvider)
                            // Container(
                            //         width: 120.w,
                            //         height: 120.h,
                            //         decoration: new BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             color: Colors.white,
                            //             image: new DecorationImage(
                            //                 fit: BoxFit.fill,
                            //                 image:
                            //                 _newUserBioScreenServices.image == null
                            //                     ? NetworkImage(
                            //                         userProfileUrlUniversal.value,
                            //                       )
                            //                     : FileImage(_newUserBioScreenServices.file) as ImageProvider
                            //             )))
                            : nameImage(name: _newUserBioScreenServices.cgFullNameEditingController.text);
                      }),
                      Positioned(
                          bottom: -10,
                          right: 5,
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kConstantLightPurple,
                                boxShadow: [BoxShadow(color: Colors.white, spreadRadius: 2.sp)]),
                            child: IconButton(
                                onPressed: () async {
                                  // _profileImageUploadFirebase.uploadImage(picName: "cgProfilePic");

                                  _newUserBioScreenServices.image =
                                      await _newUserBioScreenServices.picker.pickImage(source: ImageSource.gallery);
                                  _newUserBioScreenServices.file = File(_newUserBioScreenServices.image!.path);
                                  setState(() {});
                                },
                                icon: Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.white,
                                  //size: 36.sp,
                                )),
                          ))
                    ],
                  ),
                  ProfileTextFields(
                    textEditingController: _newUserBioScreenServices.cgFullNameEditingController,
                    type: "NAME",
                    text: _newUserBioScreenServices.cg_firstName + " " + _newUserBioScreenServices.cg_lastName,
                  ),
                  ProfileTextFields(
                    textEditingController: _newUserBioScreenServices.cgMantraController,
                    type: "MY MANTRA",
                    text: "",
                  ),
                  // ProfileTextFields(
                  //   type: "PHONE",
                  //   text: _userBioServices.data["data"]["phone"] ?? "",
                  // ),
                  ProfileTextFields(
                    textEditingController: _newUserBioScreenServices.cgEmailEditingController,
                    type: "EMAIL",
                    text: _newUserBioScreenServices.cg_email,
                  ),
                  // ProfileTextFields(
                  //   type: "RELATIONSHIP TO CARE RECIPIENT",
                  //   text: "",
                  // ),
                  ProfileTextFields(
                    textEditingController: _newUserBioScreenServices.cg_zipcodeEditingController,
                    type: "Zip Code",
                    text: _newUserBioScreenServices.cg_zipcode,
                  ),
                  // ProfileTextFields(
                  //   type: "HOME LOCATION",
                  //   text: "",
                  // ),
                  ProfileTextFields(
                    textEditingController: _newUserBioScreenServices.cgDobEditingController,
                    type: "DATE OF BIRTH",
                    text: _newUserBioScreenServices.dob,
                  ),
                  // ProfileTextFields(
                  //   type: "LIVING SITUATION",
                  //   text: "",
                  // ),
                  // ProfileTextFields(
                  //   type: "EMPLOYMENT STATUS",
                  //   text: "",
                  // ),
                  // ProfileTextFields(
                  //   type: "ADDITIONAL INFORMATION",
                  //   text: "",
                  // ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          if (_newUserBioScreenServices.HasAnythingChanged == true) {
            UserBioServices.apiGetCgProfile(navigateMethod: "off");
          } else {
            Navigator.pop(context);
          }

          return false;
        });
  }
}

class ProfileTextFields extends StatelessWidget {
  ProfileTextFields({required this.type, required this.text, required this.textEditingController});

  final String type;
  final String text;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
      margin: EdgeInsets.only(bottom: 10.sp),
      child: TextField(
        controller: textEditingController,
        cursorColor: kConstantPurple,
        decoration: InputDecoration(
            labelText: type,
            labelStyle: TextStyle(color: Colors.grey, fontFamily: 'TTCommons-DemiBold'),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: UnderlineInputBorder(borderSide: BorderSide(color: kConstantPurple)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kConstantPurple)),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300))),
      ),
    );
  }
}
