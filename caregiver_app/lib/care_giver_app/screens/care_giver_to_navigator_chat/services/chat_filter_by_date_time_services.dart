import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatFilterByDateTimeServices extends GetxController {
  var currentTimeStamp = DateTime.now().millisecondsSinceEpoch;

  List<String> dayGap(String messageTime, String lastMessageTime) {
    List<String> dataList = [];

    int messageTimeAndLastMessageTimeCompare = (DateFormat("dd/MM/yyyy")
                .parse(DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.parse(messageTime))))
                .difference(DateFormat("dd/MM/yyyy")
                    .parse(DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.parse(lastMessageTime)))))
                .inHours /
            24)
        .round();
    dataList.add(messageTimeAndLastMessageTimeCompare.toString());
    int messageTimeCurrentMessageTimeCompare = (DateFormat("dd/MM/yyyy")
                .parse(DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(currentTimeStamp)))
                .difference(DateFormat("dd/MM/yyyy")
                    .parse(DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.parse(messageTime)))))
                .inHours /
            24)
        .round();
    if (messageTimeCurrentMessageTimeCompare == 0) {
      dataList.add("Today");
    } else if (messageTimeCurrentMessageTimeCompare == 1) {
      dataList.add("Yesterday");
    } else {
      dataList.add(DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(int.parse(messageTime))));
    }
    return dataList;
  }
}
