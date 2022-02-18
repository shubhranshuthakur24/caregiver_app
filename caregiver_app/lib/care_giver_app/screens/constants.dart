import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

const Color kConstantPurple = Color(0xFF625DF5);
// 0xFF625DF5 (Latest Being used)
//0xFF5D5FEF
const Color kConstantLightPurple = Color(0xFF786fe0);
// const Color SteelGrey = Color(0xFFF1F3F5);
const Color SteelGrey = Color(0xFFF5F6FB);
const Color ShadowColor = Color(0xFFE0E0E0);
const Color bootomNavBarBackgroundColor = Color(0xFFF9F9F9);

// const Color SteelGrey1 = Color(0xFFE8EAF6);

//0xFFF1F3F5 Steelgrey1
//new white F6F9FC
const Color kConstantPaleWhite = Color(0xFFF1F3F5);
const Color kConstantDarkPurpleTextColor = Color(0xFF554e56);
// const Color kConstantPaleWhite = Color(0xFFFaF9F7);
// green 008599
// dark blue
//light indigo 4262FF
// new purple #4262FF
// Givershealthapp@gmail.com
const Color kConstantGrey = Color(0xFF43525f);
const Color kConstantBlue = Color(0xFF32a3c9);
const Color kToolKitPink = Color(0xFFcf0070);
const Color kToolKitBlue = Color(0xFF025ee7);
const Color kToolKitGreen = Color(0xFF167f24);
const Color kToolKitYellow = Color(0xFFf2b416);
const Color kBlueGreyTextColor = Color(0xff374655);
const Color kBorderGrey = Color(0xFFe6e8ea);
const Color kVeryLightGrey = Color(0x8005182a);

const Color kConstantLightBlue = Color(0xFFf2fbff);
const Color kConstantBorderLightBlue = Color(0xFFd0eef8);
const Color formLandingColor1 = Color(0xfffaf9f7);
const Color formLandingColor2 = Color(0xff43525f);
const Color formLandingColor3 = Color(0xff5d6975);
const Color formLandingColor4 = Color(0xffe6e8ea);
const Color kConstantProgressbarColor = Color(0xff007a7c);
const Color siginPageTextColor1 = Colors.black26;
const Color siginPageTextColor2 = Color(0xff374655);
const Color siginPageTextColor3 = Color(0xfff21717);
const Color siginPageTextColor4 = Color(0xfffaf9f7);
const Color siginPageTextColor11 = Color(0xff828b94);
const Color kBottomBarIcons = Color(0xFF6a747f);
const Color kConstantUserProfileTextGreyColor = Color(0xffb43525f);
const Color kConstantAssessmentButtonBackgroundColor = Colors.white;
Color kConstantInActiveButtonColor = kConstantPurple.withOpacity(0.5);
var assessmentButtonBorderRadius = 10.r;
RxString userProfileUrlUniversal = "".obs;
RxString lovedOneProfileUrlUniversal = "".obs;

class GoBack extends StatelessWidget {
  const GoBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(CupertinoIcons.back, color: kBlueGreyTextColor),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

hideLoading() {
  if (Get.isDialogOpen == true) {
    Get.back();
  }
}

showLoading({String title = "Loading..."}) {
  Get.dialog(
    WillPopScope(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 40,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        }),
    barrierDismissible: false,
  );
}

Container nameImage(
    {required String name,
    int width = 120,
    int height = 120,
    Color TextColor = Colors.white,
    Color BackGroundColor = kConstantPurple,
    int TextSize = 40}) {
  return Container(
    width: width.w,
    height: height.h,
    decoration: BoxDecoration(shape: BoxShape.circle, color: BackGroundColor),
    child: Center(
        child: Text(
      name == "" ? "N" : name[0].toUpperCase(),
      style: TextStyle(
          color: TextColor,
          fontSize: TextSize.sp,
          fontFamily: 'TTCommons-DemiBold'),
    )),
  );
}

SpinKitRing showSpinkitRing({Color color = Colors.white, int size = 50}) {
  return SpinKitRing(
    color: color,
    size: size.sp,
  );
}

SpinKitCircle showSpinkitCircle({Color color = Colors.white, int size = 50}) {
  return SpinKitCircle(
    color: color,
    size: size.sp,
  );
}

void showToast(String data, {Color color = kConstantPurple}) {
  Fluttertoast.showToast(
      backgroundColor: color,
      msg: data,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16.sp);
}

TextStyle kConstantBigTextStyle() {
  return TextStyle(
      fontFamily: 'TTCommons-Regular',
      // color: Colors.white,
      color: kBlueGreyTextColor,
      fontSize: 48.sp,
      letterSpacing: -0.3.sp);
}

TextStyle kConstantSmallTextStyle() {
  return TextStyle(
    fontFamily: 'TTCommons',
    // color: Colors.white,

    color: kBlueGreyTextColor,
    fontSize: 24.sp,
    letterSpacing: -.3.sp,
  );
}

TextStyle kConstantAssessmentSmallTextColor() {
  return TextStyle(
    fontFamily: 'TTCommons',
    color: Colors.black,
    fontSize: 20.sp,
    letterSpacing: -.3.sp,
  );
}

TextStyle kConstantAssessmentBigTextColor() {
  return TextStyle(
    fontFamily: 'TTCommons-Medium',
    color: kBlueGreyTextColor,
    fontWeight: FontWeight.bold,
    fontSize: 36.sp,
  );
}

TextStyle kButtonTextStyle() {
  return TextStyle(
    fontFamily: 'TTCommons-DemiBold',
    color: Colors.white,
    fontWeight: FontWeight.w500,
    // letterSpacing: 1.8.sp,
    fontSize: 18.sp,
  );
}

TextStyle kButtonTextStyle1() {
  return TextStyle(
    fontFamily: 'TTCommons-DemiBold',
    color: Colors.white,
    fontWeight: FontWeight.w500,
    // letterSpacing: 1.8.sp,
    fontSize: 18.sp,
  );
}

TextStyle kButtonTextStyle2() {
  return TextStyle(
    fontFamily: 'TTCommons-DemiBold',
    //color:kConstantPurple,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.8.sp,
    fontSize: 18.sp,
  );
}

BoxDecoration kConstantGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [kConstantPaleWhite, kConstantPaleWhite],
    ),
  );
}

BoxDecoration kConstantGradientNew() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xFF05ced1), Color(0xFF6a82d3)],
    ),
  );
}
//gradien colors
// Color(0xFF05ced1),
// Color(0xFF6a82d3),

class kConstantPadding extends StatefulWidget {
  kConstantPadding({required this.child});

  final Widget child;

  @override
  State<kConstantPadding> createState() => _kConstantPaddingState();
}

class _kConstantPaddingState extends State<kConstantPadding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.sp, right: 24.sp, top: 105.sp),
      child: widget.child,
    );
  }
}

class AssessmentQuestions extends StatelessWidget {
  const AssessmentQuestions({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 24.sp, right: 24.sp, top: 48.sp),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF43525f),
              fontSize: 24.sp,
              fontFamily: 'TTCommons-DemiBold'),
        ),
      ),
    );
  }
}

TextStyle ToolkitHeaderLarge() {
  return TextStyle(
      fontFamily: "TTCommons-Bold", color: kBlueGreyTextColor, fontSize: 24.sp);
}
