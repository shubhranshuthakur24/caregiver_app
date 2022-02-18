import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

import 'moreScreen_widgets.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kConstantBlue,
        automaticallyImplyLeading: true,
        leading: Icon(CupertinoIcons.back),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              child: Column(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                color: kConstantBlue,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      child: const Positioned(
                        bottom: -40,
                        left: 20,
                        child: CircleAvatar(
                          radius: 62,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.deepPurpleAccent,
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  "https://media.istockphoto.com/photos/smiling-mixed-race-mature-man-on-grey-background-picture-id1319763895?b=1&k=20&m=1319763895&s=170667a&w=0&h=jhqKyg62cQVZ-NjDQjpcenCdHDrprkN4caRjk4K76E8="),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70.h),
              SizedBox(
                child: Column(
                  children: const [
                    LightBlueCard(
                      primaryInsuranceName: "Medicare",
                      secondaryInsuranceName: "Medical",
                      primaryCarePhysician: "James D Yoss, MD",
                      hospitalOfChoice: 'USFC Medical Center',
                    ),
                    PhotoCard(
                      lovedOneName: 'John Whitney',
                      imageLink:
                          "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                    ),
                    MorePageDetailsButtons(
                      icon: CupertinoIcons.list_number,
                      dataText: '3 Pending',
                      questions: "Task List",
                      iconColor: Colors.blue,
                    ),
                    MorePageDetailsButtons(
                      icon: CupertinoIcons.rectangle_paperclip,
                      dataText: 'Completed',
                      questions: "Assessments",
                      iconColor: Colors.blueGrey,
                    ),
                    MorePageDetailsButtons(
                      icon: CupertinoIcons.doc_text_fill,
                      dataText: '3 Pending',
                      questions: "Task List",
                      iconColor: Color(0xFF0D47A1),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
