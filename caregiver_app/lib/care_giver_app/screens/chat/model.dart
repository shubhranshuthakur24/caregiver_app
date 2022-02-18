class Model {
  String? email;
  String? firstName;
  String? id;
  String? lastName;
  String? profileImageUrl;

  Model({this.email, this.firstName, this.id, this.lastName, this.profileImageUrl});

  Model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    id = json['id'];
    lastName = json['last_name'];
    profileImageUrl = json['profileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['id'] = id;
    data['last_name'] = lastName;
    data['profileImageUrl'] = profileImageUrl;
    return data;
  }
}
