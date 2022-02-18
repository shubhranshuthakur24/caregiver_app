class TaskListModel {
  TaskListModel({
    required this.isDone,
    required this.navigatorTaskid,
    required this.taskInfo,
    required this.taskCompletionDatetime,
  });

  late final bool isDone;
  late final int navigatorTaskid;
  late final String taskInfo;
  late final String taskCompletionDatetime;

  TaskListModel.fromJson(Map<String, dynamic> json) {
    isDone = json['is_done'];
    navigatorTaskid = json['navigator_taskid'];
    taskInfo = json['task_info'] ?? "";
    taskCompletionDatetime = json['task_completion_datetime'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_done'] = isDone;
    _data['navigator_taskid'] = navigatorTaskid;
    _data['task_info'] = taskInfo;
    _data['task_completion_datetime'] = taskCompletionDatetime;
    return _data;
  }

}
