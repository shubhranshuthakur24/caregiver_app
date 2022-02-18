import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:givershealths/care_giver_app/screens/constants.dart';
import 'package:givershealths/care_giver_app/screens/universel_widgets/universal_widgets.dart';

class CalenderAppBar extends StatefulWidget {
  const CalenderAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CalenderAppBar> createState() => _CalenderAppBarState();
}

class _CalenderAppBarState extends State<CalenderAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kToolKitPink,
      elevation: 0,
      leading: Icon(
        CupertinoIcons.book_solid,
        size: 20.sp,
        color: Colors.white,
      ),
      title: Text(
        "Calendar",
        style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(
            CupertinoIcons.plus,
            size: 24.sp,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  /// /// /// /// /// /// /// /// /// /// ///Schedule Event Dialogue is here.
                  return SimpleDialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.w),
                    contentPadding: EdgeInsets.all(20.sp),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.sp)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: Expanded(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule Event",
                                  textAlign: TextAlign.start,
                                  style: kLargeTextStyle(),
                                ),
                                SizedBox(height: 18.h),
                                Text(
                                  "TITLE",
                                  style: kSmallTextStyle(),
                                ),
                                SizedBox(height: 10.h),
                                TextField(
                                  onTap: () {},
                                  showCursor: true,
                                  cursorColor: kConstantPurple,
                                  autofocus: false,
                                  decoration: TextFieldsInputDecoration(),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "STARTS",
                                  style: kSmallTextStyle(),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TimeAndDateOutlinedButtons(
                                        dateOrtime: "DATE",
                                        pressed: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1950),
                                                  lastDate: DateTime(2100),
                                                  initialEntryMode: DatePickerEntryMode.inputOnly)
                                              .then((value) {
                                            setState(() {});
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: TimeAndDateOutlinedButtons(
                                        dateOrtime: "Time",
                                        pressed: () {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            initialEntryMode: TimePickerEntryMode.input,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "LENGTH",
                                  style: kSmallTextStyle(),
                                ),
                                SizedBox(height: 10.h),
                                const ExpansionTileWithContainer(
                                  mainTitle: "Myself",
                                  person1: "Amy",
                                  person2: "Julias",
                                  person3: "Ham",
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "ATTENDEE",
                                  style: kSmallTextStyle(),
                                ),
                                SizedBox(height: 10.h),
                                const ExpansionTileWithContainer(
                                  mainTitle: "Length",
                                  person1: "Amy",
                                  person2: "Julias",
                                  person3: "Ham",
                                ),
                                SizedBox(height: 36.h),
                                PurpleButton(
                                    text: "ADD",
                                    press: () {
                                      Navigator.pop(context);
                                    }),
                                SizedBox(height: 10.sp)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          },
        )
      ],
    );
  }
}

class ExpansionTileWithContainer extends StatelessWidget {
  const ExpansionTileWithContainer(
      {required this.mainTitle, required this.person1, required this.person2, required this.person3});

  final String mainTitle;
  final String person1;
  final String person2;
  final String person3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: kConstantPurple, width: 2.sp)),
      child: ExpansionTile(
        collapsedIconColor: kConstantPurple,
        iconColor: kConstantPurple,
        textColor: kConstantPurple,
        collapsedTextColor: kConstantPurple,
        title: Text(mainTitle),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${mainTitle} (Default)",
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            person1,
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            person2,
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            person3,
            style: TextStyle(fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}

class TimeAndDateOutlinedButtons extends StatelessWidget {
  const TimeAndDateOutlinedButtons({required this.pressed, required this.dateOrtime});

  final VoidCallback pressed;
  final String dateOrtime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: OutlinedButton(
        onPressed: pressed,
        child: Text(
          dateOrtime,
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black12, width: 2.sp),
        ),
      ),
    );
  }
}

TextStyle kSmallTextStyle() {
  return TextStyle(
      fontSize: 14.sp, color: kVeryLightGrey, fontFamily: "TTCommons-Bold", fontWeight: FontWeight.bold, letterSpacing: 0.7.sp);
}

InputDecoration TextFieldsInputDecoration() {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kConstantPurple, width: 1.5.sp),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1.5.sp),
    ),
  );
}

TextStyle kLargeTextStyle() {
  return TextStyle(fontSize: 28.sp, color: kBlueGreyTextColor, fontFamily: "TTCommons-Medium");
}

class AvailabilityButtons extends StatefulWidget {
  const AvailabilityButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<AvailabilityButtons> createState() => _AvailabilityButtonsState();
}

class _AvailabilityButtonsState extends State<AvailabilityButtons> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Row(
      children: [
        /// For all day available.

        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.sp),
            ),
            side: BorderSide(width: 1.5.sp, color: selected == false ? Colors.black : kConstantPurple),
          ),
          onPressed: () {},
          child: const Text(
            "All Day",
            style: TextStyle(color: kConstantPurple),
          ),
        ),
        SizedBox(width: 10.w),

        ///For Selected hours only.

        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.sp),
            ),
            side: BorderSide(width: 1.5.sp, color: selected == false ? Colors.black : kConstantPurple),
          ),
          child: Text(
            "Select Hours",
            style: TextStyle(color: selected == false ? Colors.black : Colors.white),
          ),
          onPressed: () {
            setState(() {
              selected = !selected;
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 50.w),
                      contentPadding: EdgeInsets.all(50.sp),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Availability",
                              style: kLargeTextStyle(),
                            ),
                            Text(
                              "23 Sep, Monday",
                              style: kSmallTextStyle(),
                            ),
                            Wrap(
                              children: const [
                                TimeOutlinedButtons(time: "All Day"),
                                TimeOutlinedButtons(time: "Unavailable"),
                                TimeOutlinedButtons(time: "10:00-11:00PM"),
                                TimeOutlinedButtons(time: "3:00-4:00 AM"),
                                TimeOutlinedButtons(time: "12:00-1:00 AM"),
                                TimeOutlinedButtons(time: "1:00-2:00 AM"),
                                TimeOutlinedButtons(time: "2:00-3:00 AM"),
                                TimeOutlinedButtons(time: "4:00-5:00 AM"),
                              ],
                            ),
                            PurpleButton(
                                text: "DONE",
                                press: () {
                                  Navigator.pop(context);
                                })
                          ],
                        )
                      ],
                    );
                  });
            });
          },
        )
      ],
    );
  }
}

class TimeOutlinedButtons extends StatelessWidget {
  const TimeOutlinedButtons({required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Container(
        constraints: BoxConstraints(minWidth: 115.w, maxWidth: 120.w),
        width: 115.w,
        child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.sp),
              ),
              side: BorderSide(width: 1.5.sp, color: kConstantPurple),
            ),
            child: Text(
              time,
              style: const TextStyle(color: kConstantPurple),
            )),
      ),
    );
  }
}
