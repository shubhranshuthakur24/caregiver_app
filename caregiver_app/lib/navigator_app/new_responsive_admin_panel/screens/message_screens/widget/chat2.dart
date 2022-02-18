import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/chat/chatroom_model.dart';
import 'package:givershealths/care_giver_app/screens/chat/firebase_query.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

import '../message_services.dart';

class Chat2 extends StatefulWidget {
  const Chat2({Key? key}) : super(key: key);

  @override
  _Chat2State createState() => _Chat2State();
}

class _Chat2State extends State<Chat2> {
  List<ChatRoomModel> chatRoomModelList = [];

  @override
  void initState() {
    super.initState();
    showToast("data");
    getChatRoom(TokenServices.firebaseUserId).then((value) {
      chatRoomModelList = value;
      getUserName();
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
    return Container(
      height: 500,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: chatRoomModelList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                      onTap: () async {
                        MessageSerivices.chatRoomId = chatRoomModelList[index].chatRoomId!;
                        MessageSerivices.otherUserName.value = chatRoomModelList[index].name.toString();
                        MessageSerivices.userId = TokenServices.firebaseUserId;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          CircleAvatar(radius: 30, backgroundImage: const NetworkImage('https://picsum.photos/200/300')),
                          SizedBox(
                            width: 10,
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
    );
  }
}
