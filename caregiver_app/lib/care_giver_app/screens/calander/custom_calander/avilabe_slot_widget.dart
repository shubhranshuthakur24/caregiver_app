import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';

import '../../constants.dart';
import '../calendar_services.dart';

class AvilableSlotWidget extends StatefulWidget {
  const AvilableSlotWidget({Key? key}) : super(key: key);

  @override
  _AvilableSlotWidgetState createState() => _AvilableSlotWidgetState();
}

class _AvilableSlotWidgetState extends State<AvilableSlotWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 300),
      child: Column(
        children: [
          Divider(thickness: 2, color: Color(0x80edeced)),
          SizedBox(height: 3),
          Row(children: [
            SizedBox(width: 17),
            Text(
              "Available Slots",
              style: TextStyle(fontSize: 14.sp, color: kBlueGreyTextColor, fontFamily: 'TTCommons-Bold'),
            )
          ]),
          SizedBox(height: 10.sp),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Obx(() {
              return CalendarServices.selectedDate.value.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 44.h,
                      child: ListView.builder(
                          itemCount: CalendarServices.availableSlotsBySelectedDate.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100.w,
                              margin: EdgeInsets.only(right: 5.w, left: 2.w, top: 2.h, bottom: 2.h),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0.sp,
                                        color: CalendarServices.slotid
                                                .isEqual(CalendarServices.availableSlotsBySelectedDate[index].slotid)
                                            ? kConstantPurple
                                            : Colors.grey),
                                  ),
                                  onPressed: () {
                                    CalendarServices.slotid = CalendarServices.availableSlotsBySelectedDate[index].slotid;

                                    setState(() {});
                                  },
                                  child: Text(
                                    CalendarServices.availableSlotsBySelectedDate[index].slotStartTime.toString(),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: CalendarServices.slotid
                                              .isEqual(CalendarServices.availableSlotsBySelectedDate[index].slotid)
                                          ? kConstantPurple
                                          : Colors.black,
                                    ),
                                  )),
                            );
                          }));
            }),
          ),
          SizedBox(height: 20),
          Obx(() {
            return CalendarServices.confirmButtonPressed.isTrue
                ? showSpinkitRing(color: kConstantPurple)
                : Container(
                    height: 50.h,
                    width: 315.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(assessmentButtonBorderRadius),
                      color: kConstantPurple,
                    ),
                    child: TextButton(
                        onPressed: () {
                          CalendarServices.apiBookSlot(
                              TokenServices.token, CalendarServices.navid, 01, CalendarServices.slotid, 01);
                        },
                        clipBehavior: Clip.antiAlias,
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(color: Colors.white, fontFamily: 'TTCommons-Medium', fontSize: 16.sp),
                        )));
          }),
          SizedBox(height: 20),

          // Center(child:actions)
        ],
      ),
    );
  }
}
