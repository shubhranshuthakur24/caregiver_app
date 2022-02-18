import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/chat_filter_by_date_time_services.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../services/static_variable.dart';

class MessageWidget extends StatefulWidget {
  var data;

  MessageWidget({this.data});

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  ChatFilterByDateTimeServices _chatFilterByDateTimeServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.sp),
        child: Container(
          child: Column(
            children: [
              _chatFilterByDateTimeServices.dayGap(widget.data["messageTime"], widget.data["lastMessageTime"])[0] == "0"
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.w),
                        Center(
                          child: Container(
                            child: Text(
                              _chatFilterByDateTimeServices.dayGap(widget.data["messageTime"], widget.data["lastMessageTime"])[1],
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black87,
                                  fontFamily: 'TTCommons-Bold',
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: widget.data["sender"] == TokenServices.firebaseUserId
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ///container for content/chats
                                  Container(
                                    constraints:
                                        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80, minWidth: 40.w),
                                    padding: EdgeInsets.all(12.sp),
                                    decoration: BoxDecoration(
                                      color: kConstantPurple,
                                      borderRadius: BorderRadius.circular(15.sp),
                                    ),
                                    child: Text(
                                      widget.data["content"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "TTCommons-DemiBold",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5.w),
                                child: Text(
                                  DateFormat('hh:mm a')
                                      .format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.data["messageTime"])))
                                      .toString(),
                                  style: TextStyle(fontSize: 10.sp, color: Colors.black38),
                                ),
                              ),
                            ],
                          )

                        ///by navigator
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ///image is here
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                widget.data["sender"] == TokenServices.firebaseUserId
                                                    ? userProfileUrlUniversal.value
                                                    : StaticVariable.navProfileUrl,
                                              )))),
                                  SizedBox(width: 5.sp),

                                  ///container for content/chats
                                  Container(
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
                                    padding: EdgeInsets.all(10.sp),
                                    decoration: BoxDecoration(
                                      color: SteelGrey,
                                      // border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(
                                        50.sp,
                                      ),
                                    ),
                                    child: Text(
                                      widget.data["content"],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "TTCommons-DemiBold",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30.w),
                                child: Text(
                                  DateFormat('hh:mm a')
                                      .format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.data["messageTime"])))
                                      .toString(),
                                  style: TextStyle(fontSize: 10.sp, color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ],
          ),
        ));
  }
}
