import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notifications.dart';

class NotificationHandler {
  static String notificationMsg = "Waiting for notifications";

  static Future<void> backroundHandler(RemoteMessage message) async {
    print(" This is message_screens from background");
    print(message.notification!.title);
    print(message.notification!.body);
  }

  static void messageHandler() {
    LocalNotificationService.initilize();

    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        // setState(() {
        //   notificationMsg = "${event.notification!.title} ${event.notification!.body} I am coming from terminated state";
        // });
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      // setState(() {
      //   notificationMsg = "${event.notification!.title} ${event.notification!.body} I am coming from foreground";
      // });
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      // setState(() {
      //   notificationMsg = "${event.notification!.title} ${event.notification!.body} I am coming from background";
      // });
    });
  }
}
