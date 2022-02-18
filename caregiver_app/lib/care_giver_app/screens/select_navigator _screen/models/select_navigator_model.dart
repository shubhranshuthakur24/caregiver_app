class SelectNavigatorModel {
  String? bio;
  String? education;
  double? ratings;
  String? lastName;
  String? profilePicUrl;
  String? state;
  String? firstName;
  int? navigatorid;
  String? city;

  SelectNavigatorModel(
      {this.bio,
      this.education,
      this.ratings,
      this.lastName,
      this.profilePicUrl,
      this.state,
      this.firstName,
      this.navigatorid,
      this.city});

  SelectNavigatorModel.fromJson(Map<String, dynamic> json) {
    bio = json['bio'] ?? "";
    education = json['education'] ?? "";
    ratings = json['ratings'];
    lastName = json['last_name'] ?? "";
    profilePicUrl = json['profile_pic_url'] ?? "";
    state = json['state'] ?? "";
    firstName = json['first_name'] ?? "";
    navigatorid = json['navigatorid'];
    city = json['city'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bio'] = this.bio;
    data['education'] = this.education;
    data['ratings'] = this.ratings;
    data['last_name'] = this.lastName;
    data['profile_pic_url'] = this.profilePicUrl;
    data['state'] = this.state;
    data['first_name'] = this.firstName;
    data['navigatorid'] = this.navigatorid;
    data['city'] = this.city;
    return data;
  }
}
