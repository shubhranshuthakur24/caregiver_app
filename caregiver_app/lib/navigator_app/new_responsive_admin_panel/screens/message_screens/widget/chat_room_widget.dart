import 'package:flutter/material.dart';

import 'chat2.dart';

class ChatRoomWidget extends StatelessWidget {
  const ChatRoomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 500, width: 400, child: const Chat2());
  }
}
