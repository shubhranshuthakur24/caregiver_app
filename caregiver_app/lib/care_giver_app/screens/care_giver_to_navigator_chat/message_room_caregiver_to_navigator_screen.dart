import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/chat_filter_by_date_time_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/static_variable.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/widget/message_type_text_field_and_send_button.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/widget/message_widget.dart';

import '../constants.dart';
import 'services/care_giver_to_navigator_services.dart';

class MessageRoomCareGiverToNavigator extends StatefulWidget {
  const MessageRoomCareGiverToNavigator({Key? key}) : super(key: key);

  @override
  _MessageRoomCareGiverToNavigatorState createState() => _MessageRoomCareGiverToNavigatorState();
}

class _MessageRoomCareGiverToNavigatorState extends State<MessageRoomCareGiverToNavigator> {

  late Stream<QuerySnapshot> _usersStream;
  final controller = Get.put(CareGiverToNavigatorServices());
  bool onChanged = true;
  final _chatFilterByDateTimeServices = Get.put(ChatFilterByDateTimeServices());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return StaticVariable.navFirstName.isEmpty
          ? const Scaffold()
          : Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Obx(() {
                  return CareGiverToNavigatorServices.taskDone.isFalse
                      ? SizedBox(
                          height: 600.h,
                          child: Center(
                              child: showSpinkitRing(
                            color: kConstantPurple,
                          )),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: SteelGrey,
                              child: Row(
                                children: [
                                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
                                          child: Text(
                                            StaticVariable.navFirstName.value + " " + StaticVariable.navLastName,
                                            style: TextStyle(
                                                fontSize: 23.sp, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                                            child: Text(
                                              "Los Angeles, California",
                                              style: TextStyle(color: Colors.grey.shade700, fontSize: 14.sp),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //bottomRight: Radius.circular(10)),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                padding: EdgeInsets.all(5.sp),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('messages')
                                      .where("chatRoomId", isEqualTo: StaticVariable.chatRoomId)
                                      .orderBy("messageTime", descending: true)
                                      .snapshots(),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text('Something went wrong');
                                    }
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: Text("Loading"),
                                      );
                                    }
                                    return ListView(
                                      scrollDirection: Axis.vertical,
                                      reverse: true,
                                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                                        return MessageWidget(
                                          data: data,
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Divider(
                              height: 0.5.h,
                              color: Colors.black,
                            ),
                            MessageTypeTextFieldAndSendButton()
                          ],
                        );
                }),
              ),
            );
    });
  }
}
