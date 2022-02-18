import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';

import 'chatroom_model.dart';
import 'message_room.dart';

late String username;

getUserName() async {
  await FirebaseFirestore.instance.collection('users').doc(TokenServices.firebaseUserId).get().then((value) {
    username = value.get("first_name").toString();
  });
}

Future<List<ChatRoomModel>> getChatRoom(userId) async {
  List<ChatRoomModel> modelList1 = [];

  List<Future<QuerySnapshot>> futures = [];
  var firstQuery = FirebaseFirestore.instance
      .collection('chatRooms')
      .where('userId', isEqualTo: userId)
      .orderBy("createdAt", descending: true)
      .get();

  var secondQuery = FirebaseFirestore.instance
      .collection('chatRooms')
      .where('otherUserId', isEqualTo: userId)
      .orderBy("createdAt", descending: true)
      .get();

  futures.add(firstQuery);
  futures.add(secondQuery);

  List<QuerySnapshot> results = await Future.wait(futures);
  for (var res in results) {
    for (var docResults in res.docs) {
      ChatRoomModel m = ChatRoomModel();
      if (docResults["userId"].toString() == TokenServices.firebaseUserId) {
        m.name = docResults["otherUserInfo"]["first_name"];
      } else {
        m.name = docResults["userInfo"]["first_name"];
      }

      m.chatRoomId = docResults["id"];

      modelList1.add(m);
    }
  }

  return modelList1;
}

Future<void> createChatRoom(
    String otherUserId, String otherUserFirstName, String otherUserLastName, String profileImageUrl) async {
  try {
    await FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(TokenServices.firebaseUserId + otherUserId)
        .get()
        .then((value) async {
      if (value.exists) {
        Get.to(const MessageRoom(),
            arguments: [TokenServices.firebaseUserId + otherUserId, TokenServices.firebaseUserId, otherUserFirstName]);
      } else {
        await FirebaseFirestore.instance
            .collection('chatRooms')
            .doc(otherUserId + TokenServices.firebaseUserId)
            .get()
            .then((value) async {
          if (value.exists) {
            Get.to(const MessageRoom(),
                arguments: [otherUserId + TokenServices.firebaseUserId, TokenServices.firebaseUserId, otherUserFirstName]);
          } else {
            var response =
                await FirebaseFirestore.instance.collection('chatRooms').doc(TokenServices.firebaseUserId + otherUserId).set({
              "Platform": "Android",
              "createdAt": DateTime.now().millisecondsSinceEpoch,
              "id": TokenServices.firebaseUserId + otherUserId,
              "isRead": false,
              "lastConversationText": null,
              "lastConversationTime": 0000000000000,
              "otherUserId": otherUserId,
              "otherUserInfo": {
                "first_name": otherUserFirstName,
                "last_name": otherUserLastName,
                "profileImageUrl": null,
              },
              "sendBy": TokenServices.firebaseUserId,
              "userId": TokenServices.firebaseUserId,
              "userInfo": {"first_name": username, "last_name": "null", "profileImageUrl": profileImageUrl}
            }).then((value) async {
              Get.to(const MessageRoom(), arguments: [
                TokenServices.firebaseUserId + otherUserId,
                TokenServices.firebaseUserId,
                otherUserFirstName.toString()
              ]);
            });

            print("firebase response1111 ${response.id}");
          }
        });
      }
    });
  } catch (exception) {
    print("Error Saving Data at firestore $exception");
  }
}

sendMessage(String chatRoomId, String senderId, String message) async {
  try {
    var response = await FirebaseFirestore.instance.collection('messages').add({
      "chatRoomId": chatRoomId,
      "content": message,
      "id": senderId,
      "isRead": false,
      "messageTime": DateTime.now().millisecondsSinceEpoch,
      "sender": senderId,
      "type": "text",
    }).then((value) {});

    print("firebase response1111 ${response.id}");
  } catch (exception) {
    print("Error Saving Data at firestore $exception");
  }
}
