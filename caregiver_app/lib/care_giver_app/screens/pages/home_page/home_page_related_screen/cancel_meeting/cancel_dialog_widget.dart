import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home_page_screen/homepage_widgets.dart';
import 'meeting_cancel_reason_dialog.dart';

CancelDialogWidget({required BuildContext context, required String title, required String ActionName}) {
  // showModalBottomSheet(
  //     context: context,
  //     builder: (builder) {
  //       return Container(child: Text("Sameer Singh"),);
  //     });

  showDialog(
      context: context,
      builder: (_) => SimpleDialog(
            insetPadding: EdgeInsets.all(50.sp),
            title: Text(title),
            children: [
              Row(
                children: [
                  DialogButton(
                    text: "YES",
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (_) => MeetingCancelReasonDialog(
                                ActionName: ActionName,
                              ));
                    },
                  ),
                  DialogButton(
                    text: "NO",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              )
            ],
          ));
}
