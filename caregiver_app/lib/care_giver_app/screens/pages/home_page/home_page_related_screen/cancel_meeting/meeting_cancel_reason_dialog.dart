import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/care_giver_app/screens/calander/calander_popup_screen.dart';
import 'package:givershealths/care_giver_app/screens/pages/home_page/home_page_related_screen/cancel_meeting/cancel_meeting_services.dart';

import '../../../../constants.dart';

class MeetingCancelReasonDialog extends StatelessWidget {
  CancelMeetingServices _cancelMeetingServices = Get.put(CancelMeetingServices());
  TextEditingController _textEditingController = TextEditingController();
  String ActionName;

  MeetingCancelReasonDialog({required this.ActionName});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      insetPadding: EdgeInsets.all(40.sp),
      title: Text("Reason For Cancellation"),
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(right: 10.sp, top: 10.sp, left: 10.sp),
            child: TextField(
              controller: _textEditingController,
              cursorColor: kConstantPurple,
              decoration: InputDecoration(
                  // fillColor: kConstantLightPurple,
                  // filled: true,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: kConstantPurple,
                  )),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: kConstantPurple,
                  ))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 18.sp, left: 18.sp, right: 18.sp),
          child: Obx(() {
            return _cancelMeetingServices.buttonPressed.isTrue
                ? showSpinkitRing(color: kConstantPurple)
                : OutlinedButton(
                    autofocus: true,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: kConstantPurple, width: 2.sp),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      "CONFIRM CANCELLATION",
                      style: TextStyle(color: kConstantPurple),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      if (_textEditingController.text.isEmpty) {
                        showToast("Cancel Reason Can't Be Empty");
                      } else {
                        if (ActionName == "Cancel") {
                          _cancelMeetingServices.cancelMeetingApiFunction(CancelReson: _textEditingController.text.trim());
                        } else if (ActionName == "Reschedule") {
                          _cancelMeetingServices
                              .cancelMeetingApiFunction(CancelReson: _textEditingController.text.trim())
                              .then((value) {
                            CalanderPopUpScreen.selectDate(context);
                          });
                        }
                      }
                    },
                  );
          }),
        )
      ],
    );
  }
}
