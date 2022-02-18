class ToolKitFormModel {
  ToolKitFormModel({
    required this.toolkitData,
  });

  late final ToolkitData toolkitData;

  ToolKitFormModel.fromJson(Map<String, dynamic> json) {
    toolkitData = ToolkitData.fromJson(json['toolkit_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toolkit_data'] = toolkitData.toJson();
    return _data;
  }
}

class ToolkitData {
  ToolkitData({
    required this.formatid,
    required this.duration,
    required this.mediaUrl,
    required this.toolkitTypeid,
    required this.title,
    required this.info,
    required this.isSaved,
    required this.categoryData,
    required this.toolkitid,
    required this.toolkitType,
    required this.format,
  });

  late final int formatid;
  late final int duration;
  late final String mediaUrl;
  late final int toolkitTypeid;
  late final String title;
  late final String info;
  late final bool isSaved;
  late final List<CategoryData> categoryData;
  late final int toolkitid;
  late final String toolkitType;
  late final String format;

  ToolkitData.fromJson(Map<String, dynamic> json) {
    formatid = json['formatid'];
    duration = json['duration'];
    mediaUrl = json['media_url'];
    toolkitTypeid = json['toolkit_typeid'];
    title = json['title'];
    info = json['info'];
    isSaved = json['is_saved'];
    categoryData = List.from(json['category_data']).map((e) => CategoryData.fromJson(e)).toList();
    toolkitid = json['toolkitid'];
    toolkitType = json['toolkit_type'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['formatid'] = formatid;
    _data['duration'] = duration;
    _data['media_url'] = mediaUrl;
    _data['toolkit_typeid'] = toolkitTypeid;
    _data['title'] = title;
    _data['info'] = info;
    _data['is_saved'] = isSaved;
    _data['category_data'] = categoryData.map((e) => e.toJson()).toList();
    _data['toolkitid'] = toolkitid;
    _data['toolkit_type'] = toolkitType;
    _data['format'] = format;
    return _data;
  }
}

class CategoryData {
  CategoryData({
    required this.category,
    required this.categoryid,
  });

  late final String category;
  late final int categoryid;

  CategoryData.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryid = json['categoryid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['categoryid'] = categoryid;
    return _data;
  }
}
