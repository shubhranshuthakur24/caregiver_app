class NotificationModel {
  NotificationModel({
    required this.notificationData,
    required this.daysOld,
    required this.title,
    required this.userNotificationid,
    required this.body,
  });

  late final List<dynamic> notificationData;
  late final int daysOld;
  late final String title;
  late final int userNotificationid;
  late final String body;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    try {
      notificationData = List.castFrom<dynamic, dynamic>(json['notification_data']);
    } catch (error) {}

    daysOld = json['days_old'];
    title = json['title'];
    userNotificationid = json['user_notificationid'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['notification_data'] = notificationData;
    _data['days_old'] = daysOld;
    _data['title'] = title;
    _data['user_notificationid'] = userNotificationid;
    _data['body'] = body;
    return _data;
  }
}
