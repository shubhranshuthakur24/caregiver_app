import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import 'create_update_task_services.dart';
import 'custom_date_picker_for_create_task_update_task.dart';

class CreateTaskUpdateBottomSheetContainer extends StatefulWidget {
  String ActionName;
  bool? dateTimeExit = false;

  CreateTaskUpdateBottomSheetContainer({required this.ActionName, this.dateTimeExit});

  @override
  _CreateTaskUpdateBottomSheetContainerState createState() => _CreateTaskUpdateBottomSheetContainerState();
}

class _CreateTaskUpdateBottomSheetContainerState extends State<CreateTaskUpdateBottomSheetContainer> {
  final CreateUpdateTaskServices _createTaskServices = Get.put(CreateUpdateTaskServices());

  @override
  void initState() {
    if (widget.ActionName == "Update") {
      if (widget.dateTimeExit == true) {
        _createTaskServices.visibleFlagDateTime = true;
        _createTaskServices.visibleFlagSelectDateTimeButton = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.sp, 10.sp, 24.sp, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Row(
                children: [
                  Text(
                    widget.ActionName + " Task",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 28.sp, color: kBlueGreyTextColor, fontFamily: "TTCommons-Medium"),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      CupertinoIcons.xmark,
                      color: kBlueGreyTextColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19.h),
              Text(
                "TASK",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: kVeryLightGrey,
                    fontFamily: "TTCommons-Bold",
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7.sp),
              ),
              SizedBox(height: 9.h),
              TextField(
                controller: _createTaskServices.taskEditingController,
                onTap: () {},
                showCursor: true,
                maxLines: 2,
                cursorColor: kConstantPurple,
                autofocus: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 2.sp),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                "DEADLINE ( OPTIONAL )",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: kVeryLightGrey,
                    fontWeight: FontWeight.bold,
                    fontFamily: "TTCommons-Bold",
                    letterSpacing: 0.7.sp),
              ),
              SizedBox(height: 10.h),
              // InputDatePickerFormField(
              //     firstDate: DateTime.now(), lastDate: DateTime(2100)),
              Visibility(
                  visible: _createTaskServices.visibleFlagSelectDateTimeButton,
                  child: SizedBox(
                    height: 35.h,
                    child: OutlinedButton(
                      onPressed: () {
                        _createTaskServices.visibleFlagDateTime = _createTaskServices.visibleFlagDateTime == false ? true : false;
                        _createTaskServices.visibleFlagSelectDateTimeButton =
                            _createTaskServices.visibleFlagDateTime == false ? true : false;
                        setState(() {});
                      },
                      child: Center(
                        child: Text(
                          "Select Date Time",
                          style: TextStyle(color: kVeryLightGrey, fontSize: 18.sp),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black12, width: 2.sp),
                      ),
                    ),
                  )),
              Visibility(
                  visible: _createTaskServices.visibleFlagDateTime,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: OutlinedButton(
                            onPressed: () {
                              CustomDatePickerForCreateTaskUpdateTask.showDatePicker(
                                      context: context,
                                      initialDate: _createTaskServices.selectedDate.value,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(3000),
                                      initialEntryMode: DatePickerEntryMode.inputOnly)
                                  .then((value) {
                                setState(() {
                                  _createTaskServices.selectedDate.value = value!;
                                });
                              });
                            },
                            child: Obx(() {
                              return Center(
                                child: Text(
                                  DateFormat('yMMMd').format(_createTaskServices.selectedDate.value).toString(),
                                  style: TextStyle(color: kConstantPurple, fontSize: 18.sp),
                                ),
                              );
                            }),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.black12, width: 2.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: OutlinedButton(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                initialEntryMode: TimePickerEntryMode.input,
                              ).then((value) {
                                setState(() {
                                  _createTaskServices.selectedTime = value!;
                                });
                              });
                            },
                            child: Text(
                              _createTaskServices.selectedTime.format(context).toString(),
                              style: TextStyle(color: kConstantPurple, fontSize: 18.sp),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.black12, width: 2.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 20.h),
              Text(
                "ASSIGN TO ( OPTIONAL )",
                style: TextStyle(
                    color: kVeryLightGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "TTCommons-Bold",
                    letterSpacing: 0.7.sp),
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2.sp),
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                ),
                child: ExpansionTile(
                  collapsedIconColor: kConstantPurple,
                  iconColor: kConstantPurple,
                  textColor: kConstantPurple,
                  collapsedTextColor: kConstantPurple,
                  title: const Text(
                    "Myself",
                    style: TextStyle(color: kVeryLightGrey),
                  ),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Myself (Default)",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Person 1",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Person 2",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // MaterialButton(
              //   elevation: 0,
              //   minWidth: double.infinity,
              //   height: 50.h,
              //   splashColor: kConstantPurple,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(50.sp),
              //     side: BorderSide(color: kConstantPurple, width: 2.2.sp),
              //   ),
              //   color: kConstantPurple,
              //   child: Text(
              //     "Cancel",
              //     style: kButtonTextStyle(),
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                return _createTaskServices.buttonPressed.value == true
                    ? showSpinkitRing(color: kConstantPurple)
                    : MaterialButton(
                        elevation: 0,
                        minWidth: double.infinity,
                        height: 50.h,
                        splashColor: kConstantPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.sp),
                          side: BorderSide(color: kConstantPurple, width: 2.2.sp),
                        ),
                        color: kConstantPurple,
                        child: Text(
                          widget.ActionName,
                          style: kButtonTextStyle(),
                        ),
                        onPressed: () {
                          _createTaskServices.formValidation(ActionName: widget.ActionName);
                          // Navigator.pop(context);
                        },
                      );
              }),
              SizedBox(height: 10.sp)
            ],
          ),
        ),
      ),
    );
  }
}
