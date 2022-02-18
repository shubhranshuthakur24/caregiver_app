class ToolKitFaqModels {
  ToolKitFaqModels({
    required this.toolkitData,
  });

  late final ToolkitData toolkitData;

  ToolKitFaqModels.fromJson(Map<String, dynamic> json) {
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
    required this.toolkitTypeid,
    required this.format,
    required this.categoryData,
    required this.title,
    required this.toolkitType,
    required this.formatid,
    required this.info,
  });

  late final int toolkitTypeid;
  late final String format;
  late final List<CategoryData> categoryData;
  late final String title;
  late final String toolkitType;
  late final int formatid;
  late final String info;

  ToolkitData.fromJson(Map<String, dynamic> json) {
    toolkitTypeid = json['toolkit_typeid'];
    format = json['format'];
    categoryData = List.from(json['category_data']).map((e) => CategoryData.fromJson(e)).toList();
    title = json['title'];
    toolkitType = json['toolkit_type'];
    formatid = json['formatid'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toolkit_typeid'] = toolkitTypeid;
    _data['format'] = format;
    _data['category_data'] = categoryData.map((e) => e.toJson()).toList();
    _data['title'] = title;
    _data['toolkit_type'] = toolkitType;
    _data['formatid'] = formatid;
    _data['info'] = info;
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
