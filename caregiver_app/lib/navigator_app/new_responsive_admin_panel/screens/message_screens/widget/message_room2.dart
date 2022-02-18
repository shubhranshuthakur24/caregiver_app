import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/send_message_services.dart';

import '../message_services.dart';

class MessageRoom2 extends StatefulWidget {
  const MessageRoom2({Key? key}) : super(key: key);

  @override
  _MessageRoom2State createState() => _MessageRoom2State();
}

class _MessageRoom2State extends State<MessageRoom2> {
  late final String chatRoomId;
  late final String userId;
  late final String otherUserName;
  TextEditingController messageController = TextEditingController();
  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    // TODO: implement initState

    chatRoomId = MessageSerivices.chatRoomId;
    userId = MessageSerivices.userId;
    otherUserName = MessageSerivices.otherUserName.value;

    _usersStream = FirebaseFirestore.instance
        .collection('messages')
        .where("chatRoomId", isEqualTo: chatRoomId)
        .orderBy("messageTime", descending: true)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 40.r, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          otherUserName,
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.only(right: 10.w, left: 10.w),
                height: 622.h,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
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
                      // controller: _myController,
                      reverse: true,
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return Container(
                          margin: data['sender'] == userId ? EdgeInsets.only(left: 30.w) : EdgeInsets.only(right: 30.w),
                          child: Row(
                            mainAxisAlignment: data['sender'] == userId ? MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
                                  decoration: BoxDecoration(
                                    color: data['sender'] == userId ? Colors.blue : Colors.black12,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: Text(
                                    data['content'].toString(),
                                    style: TextStyle(
                                        fontFamily: "TTCommons-Bold",
                                        color: data['sender'] == userId ? Colors.white : Colors.black,
                                        fontSize: 20.sp),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 5.w, left: 5.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Flexible(
                        child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(border: InputBorder.none, hintText: "Type message_screens here"),
                    )),
                    TextButton(
                        onPressed: () {
                          if (messageController.text.trim().isNotEmpty) {
                            SendMessageServices.getChatRoomDetails(
                                chatRoomId, TokenServices.firebaseUserId, messageController.text);

                            messageController.clear();
                          }
                        },
                        child: Icon(
                          Icons.send_rounded,
                          size: 50.r,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
