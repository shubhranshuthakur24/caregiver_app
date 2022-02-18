import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';

import 'chatroom_model.dart';
import 'firebase_query.dart';
import 'message_room.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<ChatRoomModel> chatRoomModelList = [];

  @override
  void initState() {
    super.initState();
    getChatRoom(TokenServices.firebaseUserId).then((value) {
      chatRoomModelList = value;
      getUserName();
      print("Sameer Singh");
      print(value.toString());
      if (this.mounted) {
        setState(() {
          // Your state change code goes here
        });
      }
      // setState(() {});
    });

    // chatRoomModelList = await getUserProfileData("userId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: chatRoomModelList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 20.h),
                  padding: EdgeInsets.only(left: 10.w),
                  child: InkWell(
                      onTap: () async {
                        Get.to(const MessageRoom(), arguments: [
                          chatRoomModelList[index].chatRoomId,
                          TokenServices.firebaseUserId,
                          chatRoomModelList[index].name.toString()
                        ]);
                      },
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.person_rounded,
                          //   color: Colors.black,
                          //   size: 50.h,
                          // ),
                          CircleAvatar(
                              radius: 30.r,
                              // backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                              backgroundImage: const NetworkImage('https://picsum.photos/200/300')),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            chatRoomModelList[index].name.toString(),
                            style: TextStyle(
                                fontFamily: 'TTCommons-Bold', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
