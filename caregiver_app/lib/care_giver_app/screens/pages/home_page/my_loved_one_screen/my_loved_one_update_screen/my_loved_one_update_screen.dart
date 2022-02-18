import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/my_loved_one_screen/my_loved_one_update_screen/my_loved_one_update_screen_services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';

class MyLovedOneUpdateScreen extends StatefulWidget {
  const MyLovedOneUpdateScreen({Key? key}) : super(key: key);

  @override
  _MyLovedOneUpdateScreenState createState() => _MyLovedOneUpdateScreenState();
}

class _MyLovedOneUpdateScreenState extends State<MyLovedOneUpdateScreen> {
  MyLovedOneUpdateScreenServices _myLovedOneUpdateScreenServices = Get.put(MyLovedOneUpdateScreenServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SteelGrey,
      appBar: AppBar(
        backgroundColor: SteelGrey,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                _myLovedOneUpdateScreenServices.LovedOneProfileUpdate();
              },
              child: Text(
                "Done",
                style: TextStyle(color: kConstantPurple, fontWeight: FontWeight.w400, fontSize: 16.sp),
              )),
        ],
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black87, fontSize: 15.sp, fontFamily: 'TTCommons-DemiBold', fontWeight: FontWeight.bold),
        ),
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
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
                    return _myLovedOneUpdateScreenServices.image != null || lovedOneProfileUrlUniversal.value.isNotEmpty
                        ? CircleAvatar(
                            radius: 60.r,
                            backgroundImage: _myLovedOneUpdateScreenServices.image == null
                                ? NetworkImage(
                                    lovedOneProfileUrlUniversal.value,
                                  )
                                : FileImage(_myLovedOneUpdateScreenServices.file) as ImageProvider)
                        : nameImage(name: _myLovedOneUpdateScreenServices.nameTextEditingController.text);
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
                              _myLovedOneUpdateScreenServices.image =
                                  await _myLovedOneUpdateScreenServices.picker.pickImage(source: ImageSource.gallery);
                              _myLovedOneUpdateScreenServices.file = File(_myLovedOneUpdateScreenServices.image!.path);
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
                type: "NAME",
                textEditingController: _myLovedOneUpdateScreenServices.nameTextEditingController,
              ),
              ProfileTextFields(
                type: "DATE OF BIRTH",
                textEditingController: _myLovedOneUpdateScreenServices.dobTextEditingController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTextFields extends StatelessWidget {
  String type;
  TextEditingController textEditingController;

  ProfileTextFields({required this.type, required this.textEditingController});

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
