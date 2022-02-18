// class ModelResourcesBudel {
//   ModelResourcesBudel({
//     required this.resourceData,
//   });
//
//   late final ResourceData resourceData;
//
//   ModelResourcesBudel.fromJson(Map<String, dynamic> json) {
//     resourceData = ResourceData.fromJson(json['resource_data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['resource_data'] = resourceData.toJson();
//     return _data;
//   }
// }
//
// class ResourceData {
//   ResourceData({
//     required this.title,
//     required this.info,
//     required this.tagData,
//     required this.resourceid,
//   });
//
//   late final String title;
//   late final String info;
//   late final List<TagData> tagData;
//   late final int resourceid;
//
//   ResourceData.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     info = json['info'];
//     tagData = List.from(json['tag_data']).map((e) => TagData.fromJson(e)).toList();
//     resourceid = json['resourceid'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['title'] = title;
//     _data['info'] = info;
//     _data['tag_data'] = tagData.map((e) => e.toJson()).toList();
//     _data['resourceid'] = resourceid;
//     return _data;
//   }
// }
//
// class TagData {
//   TagData({
//     required this.tagid,
//     required this.tag,
//   });
//
//   late final int tagid;
//   late final String tag;
//
//   TagData.fromJson(Map<String, dynamic> json) {
//     tagid = json['tagid'];
//     tag = json['tag'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['tagid'] = tagid;
//     _data['tag'] = tag;
//     return _data;
//   }
// }
