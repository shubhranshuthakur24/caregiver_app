import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/message_room_caregiver_to_navigator_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/home_page_screen/home_page_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/resource_bundle_page/resource_bundle_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/task_lists_page/task_list_page_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/toolkit_page/toolkit.dart';

import '../constants.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedItem = 0;
  final _pageController = PageController();
  final _pages = [
    const HomePageScreen(),
    const TaskListsPageScreen(),
    const MessageRoomCareGiverToNavigator(),
    const ResourceBundleScreen(),
    const ToolKit(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: SteelGrey, border: Border(top: BorderSide(width: 0.5, color: ShadowColor))),
          height: 55.h,
          child: BottomNavigationBar(
            backgroundColor: bootomNavBarBackgroundColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            iconSize: 18.sp,
            selectedIconTheme: IconThemeData(
              size: 18.sp,
            ),
            unselectedIconTheme: IconThemeData(size: 18.sp),
            elevation: 0,
            selectedItemColor: kConstantPurple,
            showSelectedLabels: true,
            unselectedItemColor: Color(0xB4000000),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.list_bullet), label: 'List'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble), label: 'Inbox'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: 'Resources'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.archivebox), label: 'Tools'),
            ],
            currentIndex: _selectedItem,
            onTap: (index) {
              setState(
                () {
                  _selectedItem = index;
                  _pageController.animateToPage(_selectedItem, duration: const Duration(milliseconds: 900), curve: Curves.ease);
                },
              );
            },
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedItem = index;
            });
          },
          children: _pages,
        ),
      ),
    );
  }
}
