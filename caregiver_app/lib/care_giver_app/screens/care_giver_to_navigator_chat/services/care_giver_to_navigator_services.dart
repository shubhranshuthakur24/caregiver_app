import 'package:get/get.dart';

import 'care_giver_firebase_query.dart';

class CareGiverToNavigatorServices extends GetxController {
  static RxBool taskDone = false.obs;
  static RxBool SendButtonActive = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    CareGiverFirebaseQuery.createChatRoom();
    // CareGiverFirebaseQuery.createChatRoomFist();
    // CareGiverFirebaseQuery.createChatRoomSecond();
    // CareGiverFirebaseQuery.createChatRoomFist();
    super.onInit();
  }
}
