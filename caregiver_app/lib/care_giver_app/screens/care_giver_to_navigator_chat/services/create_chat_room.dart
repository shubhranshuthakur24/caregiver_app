import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:givershealths/SRC/adapter/token_services.dart';
import 'package:givershealths/care_giver_app/screens/care_giver_to_navigator_chat/services/static_variable.dart';

import 'care_giver_to_navigator_services.dart';

class CareGiverFirebaseQuery {
  static Future<void> createChatRoom() async {
    try {
      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(TokenServices.firebaseUserId + StaticVariable.navFirebaseId)
          .get()
          .then((value) async {
        if (value.exists) {
          StaticVariable.chatRoomId = TokenServices.firebaseUserId + StaticVariable.navFirebaseId;
          CareGiverToNavigatorServices.taskDone.value = true;
          // Get.to(const MessageRoom(),
          //     arguments: [TokenServices.firebaseUserId + otherUserId, TokenServices.firebaseUserId, otherUserFirstName]);
        } else {
          await FirebaseFirestore.instance
              .collection('chatRooms')
              .doc(StaticVariable.navFirebaseId + TokenServices.firebaseUserId)
              .get()
              .then((value) async {
            if (value.exists) {
              StaticVariable.chatRoomId = StaticVariable.navFirebaseId + TokenServices.firebaseUserId;
              CareGiverToNavigatorServices.taskDone.value = true;
              // Get.to(const MessageRoom(),
              //     arguments: [otherUserId + TokenServices.firebaseUserId, TokenServices.firebaseUserId, otherUserFirstName]);
            } else {
              var response = await FirebaseFirestore.instance
                  .collection('chatRooms')
                  .doc(TokenServices.firebaseUserId + StaticVariable.navFirebaseId)
                  .set({
                "Platform": "Android",
                "createdAt": DateTime.now().millisecondsSinceEpoch,
                "id": TokenServices.firebaseUserId + StaticVariable.navFirebaseId,
                "isRead": false,
                "lastConversationText": null,
                "lastConversationTime": DateTime.now().millisecondsSinceEpoch,
                "otherUserId": StaticVariable.navFirebaseId,
                "otherUserInfo": {
                  "first_name": StaticVariable.navFirstName.value,
                  "last_name": StaticVariable.navLastName,
                  "profileImageUrl": null,
                },
                "sendBy": TokenServices.firebaseUserId,
                "userId": TokenServices.firebaseUserId,
                "userInfo": {
                  "first_name": StaticVariable.careGiverFirstName,
                  "last_name": StaticVariable.careGiverLastName,
                  "profileImageUrl": "profileImageUrl"
                }
              }).then((value) async {
                StaticVariable.chatRoomId = TokenServices.firebaseUserId + StaticVariable.navFirebaseId;
                CareGiverToNavigatorServices.taskDone.value = true;
                // Get.to(const MessageRoom(), arguments: [
                //   TokenServices.firebaseUserId + otherUserId,
                //   TokenServices.firebaseUserId,
                //   otherUserFirstName.toString()
                // ]);
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

  static createChatRoomFist() async {
    try {
      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(TokenServices.firebaseUserId + StaticVariable.navFirebaseId)
          .set({
        "Platform": "Android",
        "createdAt": DateTime.now().millisecondsSinceEpoch,
        "id": TokenServices.firebaseUserId + StaticVariable.navFirebaseId,
        "isRead": false,
        "lastConversationText": null,
        "lastConversationTime": DateTime.now().millisecondsSinceEpoch,
        "otherUserId": StaticVariable.navFirebaseId,
        "otherUserInfo": {
          "first_name": StaticVariable.navFirstName.value,
          "last_name": StaticVariable.navLastName,
          "profileImageUrl": null,
        },
        "sendBy": TokenServices.firebaseUserId,
        "userId": TokenServices.firebaseUserId,
        "userInfo": {
          "first_name": StaticVariable.careGiverFirstName,
          "last_name": StaticVariable.careGiverLastName,
          "profileImageUrl": "profileImageUrl"
        }
      }).then((value) async {
        StaticVariable.chatRoomId = TokenServices.firebaseUserId + StaticVariable.navFirebaseId;
        CareGiverToNavigatorServices.taskDone.value = true;
        // Get.to(const MessageRoom(), arguments: [
        //   TokenServices.firebaseUserId + otherUserId,
        //   TokenServices.firebaseUserId,
        //   otherUserFirstName.toString()
        // ]);
      });
    } catch (exception) {}
  }

  static Future createChatRoomSecond() async {
    try {
      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(StaticVariable.navFirebaseId + TokenServices.firebaseUserId)
          .get()
          .then((value) {
        if (value.exists) {
          StaticVariable.chatRoomId = StaticVariable.navFirebaseId + TokenServices.firebaseUserId;
          CareGiverToNavigatorServices.taskDone.value = true;
          // Get.to(const MessageRoom(),
          //     arguments: [otherUserId + TokenServices.firebaseUserId, TokenServices.firebaseUserId, otherUserFirstName]);
        }
      });
    } catch (exception) {}
  }

  static Future createChatRoomThird() async {
    try {
      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(TokenServices.firebaseUserId + StaticVariable.navFirebaseId)
          .get()
          .then((value) {
        if (value.exists) {
          StaticVariable.chatRoomId = TokenServices.firebaseUserId + StaticVariable.navFirebaseId;
          CareGiverToNavigatorServices.taskDone.value = true;
          // Get.to(const MessageRoom(),
          //     arguments: [TokenServices.firebaseUserId + otherUserId, TokenServices.firebaseUserId, otherUserFirstName]);
        }
      });
    } catch (exception) {}
  }
}
