import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';

import '../../constants.dart';
import '../services/care_giver_to_navigator_services.dart';
import '../services/send_message_services.dart';
import '../services/static_variable.dart';

class MessageTypeTextFieldAndSendButton extends StatefulWidget {
  const MessageTypeTextFieldAndSendButton({Key? key}) : super(key: key);

  @override
  _MessageTypeTextFieldAndSendButtonState createState() => _MessageTypeTextFieldAndSendButtonState();
}

class _MessageTypeTextFieldAndSendButtonState extends State<MessageTypeTextFieldAndSendButton> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 45.h,
      child: TextField(
        onChanged: (text) {
          CareGiverToNavigatorServices.SendButtonActive.value = text.isEmpty ? false : true;
        },
        controller: messageController,
        cursorColor: kConstantPurple,
        autocorrect: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
            suffixIcon: IconButton(
              onPressed: () {
                if (messageController.text.trim().isNotEmpty) {
                  SendMessageServices.getChatRoomDetails(
                      StaticVariable.chatRoomId, TokenServices.firebaseUserId, messageController.text);
                  messageController.clear();
                }
              },
              icon: Obx(() {
                return Icon(
                  Icons.send_sharp,
                  color: CareGiverToNavigatorServices.SendButtonActive.value == false ? Colors.grey : kConstantPurple,
                );
              }),
            ),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(50.h), borderSide: BorderSide(color: Colors.transparent, width: 0.sp)),
            fillColor: Colors.white,
            hintStyle: TextStyle(fontSize: 14.sp),
            hintText: "Write a message_screens.."),
      ),
    );
  }
}
