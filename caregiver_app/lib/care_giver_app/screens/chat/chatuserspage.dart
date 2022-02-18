import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'firebase_query.dart';

class ChatUserPage extends StatefulWidget {
  const ChatUserPage({Key? key}) : super(key: key);

  @override
  _ChatUserPageState createState() => _ChatUserPageState();
}

class _ChatUserPageState extends State<ChatUserPage> {
  String searchText = "";
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 15.w, left: 15.w),
              padding: EdgeInsets.only(right: 5.w, left: 15.w),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
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
                  const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(border: InputBorder.none, hintText: "Search Here"),
                      onChanged: (String value) {
                        setState(() {
                          searchText = value.trim();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Flexible(
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
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                      return data['first_name'].toString().isCaseInsensitiveContainsAny(searchText)
                          ? Container(
                              margin: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 20.h),
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        createChatRoom(data['id'].toString(), data["first_name"].toString(),
                                            data["last_name"].toString(), data["profileImageUrl"].toString());
                                      },
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              radius: 30.r,
                                              // backgroundImage: NetworkImage('https://via.placeholder.com/140x100')
                                              backgroundImage: const NetworkImage('https://picsum.photos/200/300')),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Flexible(
                                            child: Text(
                                              data['first_name'].toString().toString() +
                                                  "   " +
                                                  data['email'].toString().toString(),
                                              style: TextStyle(
                                                  fontFamily: 'TTCommons-Bold',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.sp),
                                            ),
                                          )
                                        ],
                                      ))
                                  // child: Text(data['content'].toString())
                                ],
                              ),
                            )
                          : Container();
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
