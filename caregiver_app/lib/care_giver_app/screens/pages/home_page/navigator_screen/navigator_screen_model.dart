class NavigatorScreenModel {
  NavigatorScreenModel({
    required this.city,
    required this.firebaseUserid,
    required this.firstName,
    required this.state,
    required this.bio,
    required this.ratings,
    required this.profilePicUrl,
    required this.phone,
    required this.navigatorid,
    required this.lastName,
    required this.education,
  });

  late final String city;
  late final String firebaseUserid;
  late final String firstName;
  late final String state;
  late final String bio;
  late final double ratings;
  late final String profilePicUrl;
  late final String phone;
  late final int navigatorid;
  late final String lastName;
  late final String education;

  NavigatorScreenModel.fromJson(Map<String, dynamic> json) {
    city = json['city']??"";
    firebaseUserid = json['firebase_userid'];
    firstName = json['first_name'];
    state = json['state']??"";
    bio = json['bio'];
    ratings = json['ratings'];
    profilePicUrl = json['profile_pic_url'];
    phone = json['phone'];
    navigatorid = json['navigatorid'];
    lastName = json['last_name'];
    education = json['education'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['firebase_userid'] = firebaseUserid;
    _data['first_name'] = firstName;
    _data['state'] = state;
    _data['bio'] = bio;
    _data['ratings'] = ratings;
    _data['profile_pic_url'] = profilePicUrl;
    _data['phone'] = phone;
    _data['navigatorid'] = navigatorid;
    _data['last_name'] = lastName;
    _data['education'] = education;
    return _data;
  }
}
