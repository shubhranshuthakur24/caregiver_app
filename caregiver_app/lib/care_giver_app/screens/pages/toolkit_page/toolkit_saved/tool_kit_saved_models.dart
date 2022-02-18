class ToolKitSavedModels {
  ToolKitSavedModels({
    required this.toolkit,
  });

  late final Toolkit toolkit;

  ToolKitSavedModels.fromJson(Map<String, dynamic> json) {
    toolkit = Toolkit.fromJson(json['toolkit']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toolkit'] = toolkit.toJson();
    return _data;
  }
}

class Toolkit {
  Toolkit({
    required this.isSaved,
    required this.duration,
    required this.toolkitType,
    required this.toolkitid,
    required this.mediaUrl,
    required this.formatid,
    required this.toolkitTypeid,
    required this.categoryData,
    required this.format,
    required this.info,
    required this.title,
  });

  late final bool isSaved;
  late final int duration;
  late final String toolkitType;
  late final int toolkitid;
  late final String mediaUrl;
  late final int formatid;
  late final int toolkitTypeid;
  late final List<CategoryData> categoryData;
  late final String format;
  late final String info;
  late final String title;

  Toolkit.fromJson(Map<String, dynamic> json) {
    isSaved = json['is_saved'];
    duration = json['duration'];
    toolkitType = json['toolkit_type'];
    toolkitid = json['toolkitid'];
    mediaUrl = json['media_url'];
    formatid = json['formatid'];
    toolkitTypeid = json['toolkit_typeid'];
    categoryData = List.from(json['category_data']).map((e) => CategoryData.fromJson(e)).toList();
    format = json['format'];
    info = json['info'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['is_saved'] = isSaved;
    _data['duration'] = duration;
    _data['toolkit_type'] = toolkitType;
    _data['toolkitid'] = toolkitid;
    _data['media_url'] = mediaUrl;
    _data['formatid'] = formatid;
    _data['toolkit_typeid'] = toolkitTypeid;
    _data['category_data'] = categoryData.map((e) => e.toJson()).toList();
    _data['format'] = format;
    _data['info'] = info;
    _data['title'] = title;
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

// class ToolKitSavedModels {
//   ToolKitSavedModels({
//     required this.toolkit,
//   });
//
//   late final Toolkit toolkit;
//
//   ToolKitSavedModels.fromJson(Map<String, dynamic> json) {
//     toolkit = Toolkit.fromJson(json['toolkit']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['toolkit'] = toolkit.toJson();
//     return _data;
//   }
// }
//
// class Toolkit {
//   Toolkit({
//     required this.toolkitTypeid,
//     required this.format,
//     required this.categoryData,
//     required this.title,
//     required this.toolkitType,
//     required this.formatid,
//     required this.info,
//   });
//
//   late final int toolkitTypeid;
//   late final String format;
//   late final List<CategoryData> categoryData;
//   late final String title;
//   late final String toolkitType;
//   late final int formatid;
//   late final String info;
//
//   Toolkit.fromJson(Map<String, dynamic> json) {
//     toolkitTypeid = json['toolkit_typeid'];
//     format = json['format'];
//     categoryData = List.from(json['category_data']).map((e) => CategoryData.fromJson(e)).toList();
//     title = json['title'];
//     toolkitType = json['toolkit_type'];
//     formatid = json['formatid'];
//     info = json['info'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['toolkit_typeid'] = toolkitTypeid;
//     _data['format'] = format;
//     _data['category_data'] = categoryData.map((e) => e.toJson()).toList();
//     _data['title'] = title;
//     _data['toolkit_type'] = toolkitType;
//     _data['formatid'] = formatid;
//     _data['info'] = info;
//     return _data;
//   }
// }
//
// class CategoryData {
//   CategoryData({
//     required this.category,
//     required this.categoryid,
//   });
//
//   late final String category;
//   late final int categoryid;
//
//   CategoryData.fromJson(Map<String, dynamic> json) {
//     category = json['category'];
//     categoryid = json['categoryid'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category'] = category;
//     _data['categoryid'] = categoryid;
//     return _data;
//   }
// }

//
//
// class ToolKitSavedModels {
//   ToolKitSavedModels({
//     required this.toolkit,
//   });
//   late final Toolkit toolkit;
//
//   ToolKitSavedModels.fromJson(Map<String, dynamic> json){
//     toolkit = Toolkit.fromJson(json['toolkit']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['toolkit'] = toolkit.toJson();
//     return _data;
//   }
// }
//
// class Toolkit {
//   Toolkit({
//     required this.formatid,
//     required this.toolkitid,
//     required this.info,
//     required this.toolkitTypeid,
//     required this.mediaUrl,
//     required this.format,
//     required this.duration,
//     required this.title,
//     required this.categoryData,
//     required this.toolkitType,
//   });
//   late final int formatid;
//   late final int toolkitid;
//   late final String info;
//   late final int toolkitTypeid;
//   late final String mediaUrl;
//   late final String format;
//   late final int duration;
//   late final String title;
//   late final List<CategoryData> categoryData;
//   late final String toolkitType;
//
//   Toolkit.fromJson(Map<String, dynamic> json){
//     formatid = json['formatid'];
//     toolkitid = json['toolkitid'];
//     info = json['info'];
//     toolkitTypeid = json['toolkit_typeid'];
//     mediaUrl = json['media_url'];
//     format = json['format'];
//     duration = json['duration'];
//     title = json['title'];
//     categoryData = List.from(json['category_data']).map((e)=>CategoryData.fromJson(e)).toList();
//     toolkitType = json['toolkit_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['formatid'] = formatid;
//     _data['toolkitid'] = toolkitid;
//     _data['info'] = info;
//     _data['toolkit_typeid'] = toolkitTypeid;
//     _data['media_url'] = mediaUrl;
//     _data['format'] = format;
//     _data['duration'] = duration;
//     _data['title'] = title;
//     _data['category_data'] = categoryData.map((e)=>e.toJson()).toList();
//     _data['toolkit_type'] = toolkitType;
//     return _data;
//   }
// }
//
// class CategoryData {
//   CategoryData({
//     required this.categoryid,
//     required this.category,
//   });
//   late final int categoryid;
//   late final String category;
//
//   CategoryData.fromJson(Map<String, dynamic> json){
//     categoryid = json['categoryid'];
//     category = json['category'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['categoryid'] = categoryid;
//     _data['category'] = category;
//     return _data;
//   }
// }
