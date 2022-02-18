import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/readmore_widget.dart';

class NavigatorCard extends StatefulWidget {
  const NavigatorCard(
      {Key? key,
      required this.navigatorName,
      required this.navigatorBio,
      required this.navigatorLocation,
      required this.imageUrl})
      : super(key: key);

  final String navigatorName;
  final String navigatorLocation;
  final String navigatorBio;
  final String imageUrl;

  @override
  State<NavigatorCard> createState() => _NavigatorCardState();
}

class _NavigatorCardState extends State<NavigatorCard> {
  bool selected = false;
  Color bgColor = Colors.white54;
  Color borderColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 15.sp, top: 20.sp, right: 15.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(widget.imageUrl),
                ),
              ),
            ),
            SizedBox(width: 20.sp),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.navigatorName,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'TTCommons-Medium')),
                Text(widget.navigatorLocation,
                    style: TextStyle(
                        fontSize: 11.sp, fontFamily: 'TTCommons-Regular')),
                SizedBox(height: 8.h),
                ReadMoreText(
                  widget.navigatorBio,
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: 'TTCommons-Regular'),
                  moreStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: kConstantPurple,
                      fontFamily: 'TTCommons-Regular'),
                  lessStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: kConstantPurple,
                      fontFamily: 'TTCommons-Regular'),
                ),
                SizedBox(height: 20.h)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
