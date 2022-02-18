class HomePageModel {
  int? notificationCount;
  String? cgProfilePic;
  int? careGiverid;
  String? cgLastName;
  String? cgFirstName;
  String? cgMantra;
  List<Tasks>? tasks;
  NavigatorData? navigatorData;
  String? firebaseUserid;

  HomePageModel(
      {this.notificationCount,
      this.cgProfilePic,
      this.careGiverid,
      this.cgLastName,
      this.cgFirstName,
      this.cgMantra,
      this.tasks,
      this.navigatorData,
      this.firebaseUserid});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    notificationCount = json['notification_count'];
    cgProfilePic = json['cg_profile_pic'] ?? "";
    careGiverid = json['care_giverid'];
    cgLastName = json['cg_last_name'] ?? "";
    cgFirstName = json['cg_first_name'] ?? "";
    cgMantra = json['cg_mantra'] ?? "";
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
    navigatorData = json['navigator_data'] != null ? new NavigatorData.fromJson(json['navigator_data']) : null;
    firebaseUserid = json['firebase_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_count'] = this.notificationCount;
    data['cg_profile_pic'] = this.cgProfilePic;
    data['care_giverid'] = this.careGiverid;
    data['cg_last_name'] = this.cgLastName;
    data['cg_first_name'] = this.cgFirstName;
    data['cg_mantra'] = this.cgMantra;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    if (this.navigatorData != null) {
      data['navigator_data'] = this.navigatorData!.toJson();
    }
    data['firebase_userid'] = this.firebaseUserid;
    return data;
  }
}

class Tasks {
  bool? isDone;
  String? taskCompletionDatetime;
  int? navigatorTaskid;
  String? taskInfo;

  Tasks({this.isDone, this.taskCompletionDatetime, this.navigatorTaskid, this.taskInfo});

  Tasks.fromJson(Map<String, dynamic> json) {
    isDone = json['is_done'];
    taskCompletionDatetime = json['task_completion_datetime'] ?? "";
    navigatorTaskid = json['navigator_taskid'];
    taskInfo = json['task_info'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_done'] = this.isDone;
    data['task_completion_datetime'] = this.taskCompletionDatetime;
    data['navigator_taskid'] = this.navigatorTaskid;
    data['task_info'] = this.taskInfo;
    return data;
  }
}

class NavigatorData {
  String? navProfilePic;
  int? meetingid;
  String? navFirebaseid;
  String? date;
  String? navFirstName;
  int? navigatorid;
  String? city;
  String? meetingTypeName;
  String? state;
  String? navLastName;
  String? firebaseUserid;
  String? slotStartTime;

  NavigatorData(
      {this.navProfilePic,
      this.meetingid,
      this.navFirebaseid,
      this.date,
      this.navFirstName,
      this.navigatorid,
      this.city,
      this.meetingTypeName,
      this.state,
      this.navLastName,
      this.firebaseUserid,
      this.slotStartTime});

  NavigatorData.fromJson(Map<String, dynamic> json) {
    navProfilePic = json['nav_profile_pic'] ?? "";
    meetingid = json['meetingid'];
    navFirebaseid = json['nav_firebaseid'] ?? "";
    date = json['date'] ?? "";
    navFirstName = json['nav_first_name'] ?? "";
    navigatorid = json['navigatorid'];
    city = json['city'] ?? "";
    meetingTypeName = json['meeting_type_name'] ?? "";
    state = json['state'] ?? "";
    navLastName = json['nav_last_name'] ?? "";
    firebaseUserid = json['firebase_userid'] ?? "";
    slotStartTime = json['slot_start_time'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nav_profile_pic'] = this.navProfilePic;
    data['meetingid'] = this.meetingid;
    data['nav_firebaseid'] = this.navFirebaseid;
    data['date'] = this.date;
    data['nav_first_name'] = this.navFirstName;
    data['navigatorid'] = this.navigatorid;
    data['city'] = this.city;
    data['meeting_type_name'] = this.meetingTypeName;
    data['state'] = this.state;
    data['nav_last_name'] = this.navLastName;
    data['firebase_userid'] = this.firebaseUserid;
    data['slot_start_time'] = this.slotStartTime;
    return data;
  }
}
