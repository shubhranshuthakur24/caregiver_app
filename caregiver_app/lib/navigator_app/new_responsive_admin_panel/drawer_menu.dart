import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/screens/message_screens/message_screen.dart';

import 'constants/constants.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("images/logopurplebackground.png"),
          ),
          DrawerListTile(title: 'Dash Board', svgSrc: Icons.dashboard, tap: () {}),
          DrawerListTile(title: 'Blog Post', svgSrc: Icons.post_add, tap: () {}),
          DrawerListTile(
              title: 'Message',
              svgSrc: Icons.message,
              tap: () {
                Get.to(() => const MessageScreen(), transition: Transition.noTransition);
              }),
          DrawerListTile(title: 'Statistics', svgSrc: Icons.list, tap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(title: 'Settings', svgSrc: Icons.settings, tap: () {}),
          DrawerListTile(title: 'Logout', svgSrc: Icons.logout, tap: () {}),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({Key? key, required this.title, required this.svgSrc, required this.tap}) : super(key: key);

  final String title;
  IconData svgSrc;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      horizontalTitleGap: 0.0,
      leading: Icon(
        svgSrc,
        color: grey,
        size: 30.0,
      ),
      title: Text(
        title,
        style: TextStyle(color: grey),
      ),
    );
  }
}
