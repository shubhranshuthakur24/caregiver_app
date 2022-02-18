class ModelToolKit {
  ModelToolKit({
    required this.toolkitData,
  });

  late final ToolkitData toolkitData;

  ModelToolKit.fromJson(Map<String, dynamic> json) {
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
    required this.toolkitType,
    required this.format,
    required this.toolkitid,
    required this.title,
    required this.duration,
    required this.formatid,
    required this.mediaUrl,
    required this.isSaved,
    required this.categoryData,
    required this.info,
    required this.toolkitTypeid,
  });

  late final String toolkitType;
  late final String format;
  late final int toolkitid;
  late final String title;
  late final int duration;
  late final int formatid;
  late final String mediaUrl;
  late final bool isSaved;
  late final List<CategoryData> categoryData;
  late final String info;
  late final int toolkitTypeid;

  ToolkitData.fromJson(Map<String, dynamic> json) {
    toolkitType = json['toolkit_type'];
    format = json['format'];
    toolkitid = json['toolkitid'];
    title = json['title'];
    duration = json['duration'];
    formatid = json['formatid'];
    mediaUrl = json['media_url'];
    isSaved = json['is_saved'];
    categoryData = List.from(json['category_data']).map((e) => CategoryData.fromJson(e)).toList();
    info = json['info'];
    toolkitTypeid = json['toolkit_typeid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toolkit_type'] = toolkitType;
    _data['format'] = format;
    _data['toolkitid'] = toolkitid;
    _data['title'] = title;
    _data['duration'] = duration;
    _data['formatid'] = formatid;
    _data['media_url'] = mediaUrl;
    _data['is_saved'] = isSaved;
    _data['category_data'] = categoryData.map((e) => e.toJson()).toList();
    _data['info'] = info;
    _data['toolkit_typeid'] = toolkitTypeid;
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
