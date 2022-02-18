import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstantPaleWhite,
      appBar: AppBar(
        toolbarHeight: 80.h,
        centerTitle: false,
        elevation: 0,
        title: const Text(
          "Your Navigator Name",
          style: TextStyle(color: kBlueGreyTextColor),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10.sp),
          padding: EdgeInsets.only(left: 15.sp),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  ))),
        ),
        backgroundColor: kConstantPaleWhite,
      ),
      body: Container(
        color: kConstantPaleWhite,
        height: 925.h,
        width: 375.w,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.80),
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1.sp, blurRadius: 3)],
                                    borderRadius: BorderRadius.circular(20.sp),
                                  ),
                                  child: Text("hey how are you?"),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: const NetworkImage(
                                          "https://media.istockphoto.com/photos/positive-mindset-positive-life-picture-id1272765753?b=1&k=20&m=1272765753&s=170667a&w=0&h=8Twyimx9TOKgr67OrabNA5sUeEgYT7ckM5HU6fnL5Ik="),
                                      radius: 20.r,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "9:27 pm",
                                      style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                const ChatScreenTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatScreenTextField extends StatelessWidget {
  const ChatScreenTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      height: 80.h,
      child: TextField(
        cursorColor: kConstantPurple,
        autocorrect: true,
        autofocus: true,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            CupertinoIcons.play_arrow_solid,
            color: kConstantPurple,
          ),
          fillColor: Colors.black12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.sp),
            borderSide: BorderSide(color: Colors.black, width: 2.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.sp),
            borderSide: BorderSide(color: kConstantPurple, width: 2.sp),
          ),
        ),
      ),
    );
  }
}
