import 'package:flutter/material.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';

import 'chatRoom.dart';
import 'chatroom_model.dart';
import 'chatuserspage.dart';
import 'firebase_query.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  List<ChatRoomModel> chatRoomModelList = [];

  @override
  void initState() {
    super.initState();
    getChatRoom(TokenServices.firebaseUserId).then((value) {
      chatRoomModelList = value;
      getUserName();

      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black45,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.messenger_outline,
                )),
                Tab(
                  icon: Icon(Icons.people_rounded),
                ),
                Tab(
                    icon: Icon(
                  Icons.settings,
                )),
              ],
            ),
            body: TabBarView(
              children: [
                ChatRoom(),
                ChatUserPage(),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
