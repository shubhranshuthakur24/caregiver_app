class ToolKitDetailsScreenModel {
  ToolKitDetailsScreenModel({
    required this.formatid,
    required this.toolkitid,
    required this.info,
    required this.toolkitTypeid,
    required this.mediaUrl,
    required this.isSaved,
    required this.format,
    required this.duration,
    required this.title,
    required this.categoryData,
    required this.toolkitType,
  });

  late final int formatid;
  late final int toolkitid;
  late final String info;
  late final int toolkitTypeid;
  late final String mediaUrl;
  late final bool isSaved;
  late final String format;
  late final int duration;
  late final String title;
  late final List<CategoryData> categoryData;
  late final String toolkitType;

  ToolKitDetailsScreenModel.fromJson(Map<String, dynamic> json) {
    formatid = json['formatid'];
    toolkitid = json['toolkitid'];
    info = json['info'];
    toolkitTypeid = json['toolkit_typeid'];
    mediaUrl = json['media_url'];
    isSaved = json['is_saved'];
    format = json['format'];
    duration = json['duration'];
    title = json['title'];
    categoryData = List.from(json['category_data']).map((e) => CategoryData.fromJson(e)).toList();
    toolkitType = json['toolkit_type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['formatid'] = formatid;
    _data['toolkitid'] = toolkitid;
    _data['info'] = info;
    _data['toolkit_typeid'] = toolkitTypeid;
    _data['media_url'] = mediaUrl;
    _data['is_saved'] = isSaved;
    _data['format'] = format;
    _data['duration'] = duration;
    _data['title'] = title;
    _data['category_data'] = categoryData.map((e) => e.toJson()).toList();
    _data['toolkit_type'] = toolkitType;
    return _data;
  }
}

class CategoryData {
  CategoryData({
    required this.categoryid,
    required this.category,
  });

  late final int categoryid;
  late final String category;

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryid = json['categoryid'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryid'] = categoryid;
    _data['category'] = category;
    return _data;
  }
}
