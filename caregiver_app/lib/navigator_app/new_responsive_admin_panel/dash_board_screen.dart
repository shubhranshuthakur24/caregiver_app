import 'package:flutter/material.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/custom_appbar.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/new_responsive_admin_panel_services.dart';

import 'constants/constants.dart';
import 'constants/responsive.dart';
import 'drawer_menu.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

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
                  children: [CustomAppbar(), Spacer()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
