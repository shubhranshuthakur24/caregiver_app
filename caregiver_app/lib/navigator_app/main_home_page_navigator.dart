import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';

import 'calendarScreen/calendar_screen.dart';
import 'chatScreen/chat_screen.dart';
import 'homeScreen/HomePage.dart';
import 'moreScreen/more_screen.dart';

class NavigatorMainHomePage extends StatefulWidget {
  const NavigatorMainHomePage({Key? key}) : super(key: key);

  @override
  _NavigatorMainHomePageState createState() => _NavigatorMainHomePageState();
}

class _NavigatorMainHomePageState extends State<NavigatorMainHomePage> {
  int _selectedItem = 0;
  final _pageController = PageController();
  final _pages = [
    const NavigatorHomePage(),
    const CalendarScreen(),
    const ChatScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
            // backgroundColor: bootomBarBackgroundColor,

            iconSize: 18.sp,
            showUnselectedLabels: true,
            selectedFontSize: 14.sp,
            selectedIconTheme: IconThemeData(size: 18.sp),
            unselectedIconTheme: IconThemeData(size: 18.sp),
            elevation: 0,
            selectedItemColor: kConstantPurple,
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.calendar), label: 'CALENDAR'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble), label: 'CHAT'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.rectangle_3_offgrid), label: 'MORE')
              // BottomNavigationBarItem(
              //     icon: SizedBox(
              //       child: Image.asset("images/moreicon.png"),
              //       height: 24,
              //       width: 24,
              //     ),
              //     label: 'MORE'),
            ],
            currentIndex: _selectedItem,
            onTap: (index) {
              setState(() {
                _selectedItem = index;
                _pageController.animateToPage(_selectedItem, duration: const Duration(milliseconds: 900), curve: Curves.ease);
              });
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
