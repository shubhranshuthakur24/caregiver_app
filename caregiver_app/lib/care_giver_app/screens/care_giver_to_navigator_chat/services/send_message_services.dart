import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/static_variable.dart';

class SendMessageServices {
  static Future sendMessage(String chatRoomId, String senderId, String message, String timeStamp, String lastMessageTime) async {
    try {
      var response = await FirebaseFirestore.instance.collection('messages').add({
        "chatRoomId": chatRoomId,
        "content": message,
        "id": senderId,
        "isRead": false,
        "lastMessageTime": lastMessageTime,
        "messageTime": timeStamp,
        "sender": senderId,
        "type": "text",
      }).then((value) {});

      print("firebase response1111 ${response.id}");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  static updateChatRoomDetails(String lastConversationText, String lastConversationTime) async {
    try {
      var response = await FirebaseFirestore.instance.collection('chatRooms').doc(StaticVariable.chatRoomId).update({
        "isRead": false,
        "lastConversationText": lastConversationText,
        "lastConversationTime": lastConversationTime,
        "sendBy": TokenServices.firebaseUserId,
      }).then((value) {});

      print("firebase response1111 ${response.id}");
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

  static getChatRoomDetails(String chatRoomId, String senderId, String message) async {
    var timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    await FirebaseFirestore.instance.collection('chatRooms').doc(StaticVariable.chatRoomId).get().then((value) {
      var lastConversationTime = value.get("lastConversationTime").toString();
      sendMessage(chatRoomId, senderId, message, timeStamp, lastConversationTime).then((value) {
        updateChatRoomDetails(message, timeStamp);
      });
    });
  }
}
