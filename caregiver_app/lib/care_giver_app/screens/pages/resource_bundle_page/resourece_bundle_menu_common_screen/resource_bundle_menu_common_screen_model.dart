class ResourceBundleMenuCommonScreenServices {
  ResourceBundleMenuCommonScreenServices({
    required this.resourceData,
  });

  late final ResourceData resourceData;

  ResourceBundleMenuCommonScreenServices.fromJson(Map<String, dynamic> json) {
    resourceData = ResourceData.fromJson(json['resource_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resource_data'] = resourceData.toJson();
    return _data;
  }
}

class ResourceData {
  ResourceData({
    required this.tagData,
    required this.info,
    required this.formatid,
    required this.duration,
    required this.format,
    required this.resourceType,
    required this.resourceid,
    required this.mediaUrl,
    required this.title,
    required this.resourceTypeid,
  });

  late final List<TagData> tagData;
  late final String info;
  late final int formatid;
  late final int duration;
  late final String format;
  late final String resourceType;
  late final int resourceid;
  late final String mediaUrl;
  late final String title;
  late final int resourceTypeid;

  ResourceData.fromJson(Map<String, dynamic> json) {
    tagData = List.from(json['tag_data']).map((e) => TagData.fromJson(e)).toList();
    info = json['info'];
    formatid = json['formatid'];
    duration = json['duration'];
    format = json['format'];
    resourceType = json['resource_type'];
    resourceid = json['resourceid'];
    mediaUrl = json['media_url'];
    title = json['title'];
    resourceTypeid = json['resource_typeid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tag_data'] = tagData.map((e) => e.toJson()).toList();
    _data['info'] = info;
    _data['formatid'] = formatid;
    _data['duration'] = duration;
    _data['format'] = format;
    _data['resource_type'] = resourceType;
    _data['resourceid'] = resourceid;
    _data['media_url'] = mediaUrl;
    _data['title'] = title;
    _data['resource_typeid'] = resourceTypeid;
    return _data;
  }
}

class TagData {
  TagData({
    required this.tagid,
    required this.tag,
  });

  late final int tagid;
  late final String tag;

  TagData.fromJson(Map<String, dynamic> json) {
    tagid = json['tagid'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tagid'] = tagid;
    _data['tag'] = tag;
    return _data;
  }
}
