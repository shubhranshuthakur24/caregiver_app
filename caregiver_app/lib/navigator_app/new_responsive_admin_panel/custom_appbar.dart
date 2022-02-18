import 'package:flutter/material.dart';
import 'package:givershealths/navigator_app/new_responsive_admin_panel/new_responsive_admin_panel_services.dart';

import 'constants/constants.dart';
import 'constants/responsive.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
              NewResponsiveAdminPanelServices.scaffoldkey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: textColor.withOpacity(0.5),
            ),
          ),
        Expanded(child: SearchField()),
        ProfileInfo()
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search for Statistics",
          helperStyle: TextStyle(
            color: textColor.withOpacity(0.5),
            fontSize: 15,
          ),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(
            Icons.search,
            color: textColor.withOpacity(0.5),
          )),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Stack(
            children: [
              Icon(
                Icons.notification_important,
                size: 25,
                color: textColor.withOpacity(0.8),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: red,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: appPadding),
          padding: EdgeInsets.symmetric(
            horizontal: appPadding,
            vertical: appPadding / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  'images/logopurplebackground.png',
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
                  child: Text(
                    'Hii, Arinalis',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
