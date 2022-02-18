import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/constants/constants.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/constants/responsive.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/screens/message_screens/message_services.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/screens/message_screens/widget/chat_room_widget.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/screens/message_screens/widget/message_room2.dart';

import '../../custom_appbar.dart';
import '../../drawer_menu.dart';
import '../../new_responsive_admin_panel_services.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(),
      key: NewResponsiveAdminPanelServices.scaffoldkey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: DrawerMenu(),
              ),
            Expanded(
              flex: 5,
              child: Container(
                color: bgColor,
                child: Column(
                  children: [
                    CustomAppbar(),
                    Row(
                      children: [
                        ChatRoomWidget(),
                        Container(
                          height: 550,
                          color: Colors.black54,
                          width: 1,
                        ),
                        Obx(() {
                          return MessageSerivices.otherUserName.value == ""
                              ? Container()
                              : Container(
                                  height: 550,
                                  width: 300,
                                  child: MessageRoom2(),
                                );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
