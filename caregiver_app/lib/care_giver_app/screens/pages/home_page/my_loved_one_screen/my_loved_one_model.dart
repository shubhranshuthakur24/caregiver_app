// class MyLovedOneModel {
//   MyLovedOneModel({
//     required this.firstName,
//     required this.secondaryInsurance,
//     required this.gender,
//     required this.lovedOneid,
//     required this.phone,
//     required this.dob,
//     required this.lastName,
//     required this.city,
//     required this.pharmacy,
//     required this.ethnicity,
//     required this.state,
//     required this.primaryCarePhysician,
//     required this.profilePicUrl,
//     required this.notes,
//     required this.primaryInsurance,
//     required this.medication,
//     required this.diseaseData,
//   });
//
//   late final String firstName;
//
//   late final String secondaryInsurance;
//   late final String gender;
//   late final int lovedOneid;
//   late final String phone;
//   late final String dob;
//   late final String lastName;
//   late final String city;
//   late final String pharmacy;
//   late final String ethnicity;
//   late final String state;
//   late final String primaryCarePhysician;
//   late final String profilePicUrl;
//   late final String notes;
//   late final String primaryInsurance;
//   late final List<int> medication;
//   late final List<DiseaseData> diseaseData;
//
//   MyLovedOneModel.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'] ?? "";
//     secondaryInsurance = json['secondary_insurance'] ?? "";
//     gender = json['gender'] ?? "";
//     lovedOneid = json['loved_oneid'];
//     phone = json['phone'] ?? "";
//     dob = json['dob'] ?? "";
//     lastName = json['last_name'] ?? "";
//     city = json['city'] ?? "";
//     pharmacy = json['pharmacy'] ?? "";
//     ethnicity = json['ethnicity'] ?? "";
//     state = json['state'] ?? "";
//     primaryCarePhysician = json['primary_care_physician'] ?? "";
//     profilePicUrl = json['profile_pic_url'] ?? "";
//     notes = json['notes'] ?? "";
//     primaryInsurance = json['primary_insurance'] ?? "";
//     medication = List.castFrom<dynamic, int>(json['medication'] ?? []);
//     diseaseData = List.from(json['disease_data'] ?? []).map((e) => DiseaseData.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['first_name'] = firstName;
//     _data['secondary_insurance'] = secondaryInsurance;
//     _data['gender'] = gender;
//     _data['loved_oneid'] = lovedOneid;
//     _data['phone'] = phone;
//     _data['dob'] = dob;
//     _data['last_name'] = lastName;
//     _data['city'] = city;
//     _data['pharmacy'] = pharmacy;
//     _data['ethnicity'] = ethnicity;
//     _data['state'] = state;
//     _data['primary_care_physician'] = primaryCarePhysician;
//     _data['profile_pic_url'] = profilePicUrl;
//     _data['notes'] = notes;
//     _data['primary_insurance'] = primaryInsurance;
//     _data['medication'] = medication;
//     _data['disease_data'] = diseaseData.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
//
// class DiseaseData {
//   DiseaseData({
//     required this.diseaseid,
//     required this.diseaseName,
//   });
//
//   late final int diseaseid;
//   late final String diseaseName;
//
//   DiseaseData.fromJson(Map<String, dynamic> json) {
//     diseaseid = json['diseaseid'];
//     diseaseName = json['disease_name'] ?? "";
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['diseaseid'] = diseaseid;
//     _data['disease_name'] = diseaseName;
//     return _data;
//   }
// }

class MyLovedOneModel {
  MyLovedOneModel({
    required this.ethnicity,
    required this.state,
    required this.secondaryInsurance,
    required this.profilePicUrl,
    required this.firstName,
    required this.city,
    required this.notes,
    required this.dob,
    required this.diseaseData,
    required this.phone,
    required this.medication,
    required this.lovedOneid,
    required this.lastName,
    required this.gender,
    required this.relationshipid,
    required this.pharmacy,
    required this.primaryInsurance,
    required this.zipcode,
    required this.primaryCarePhysician,
  });

  late final String ethnicity;
  late final String state;
  late final String secondaryInsurance;
  late final String profilePicUrl;
  late final String firstName;
  late final String city;
  late final String notes;
  late final String dob;
  late final List<DiseaseData> diseaseData;
  late final String phone;
  late final String medication;
  late final int lovedOneid;
  late final String lastName;
  late final String gender;
  late final int relationshipid;
  late final String pharmacy;
  late final String primaryInsurance;
  late final String zipcode;
  late final String primaryCarePhysician;

  MyLovedOneModel.fromJson(Map<String, dynamic> json) {
    ethnicity = json['ethnicity'] ?? "";
    state = json['state'] ?? "";
    secondaryInsurance = json['secondary_insurance'] ?? "";
    profilePicUrl = json['profile_pic_url'] ?? "";
    firstName = json['first_name'] ?? "";
    city = json['city'] ?? "";
    notes = json['notes'] ?? "";
    dob = json['dob'] ?? "";
    diseaseData = List.from(json['disease_data']).map((e) => DiseaseData.fromJson(e)).toList();
    phone = json['phone'] ?? "";
    medication = json['medication'] ?? "";
    lovedOneid = json['loved_oneid'] ?? "";
    lastName = json['last_name'] ?? "";
    gender = json['gender'] ?? "";
    relationshipid = json['relationshipid'] ?? -1;
    pharmacy = json['pharmacy'] ?? "";
    primaryInsurance = json['primary_insurance'] ?? "";
    zipcode = json['zipcode'] ?? "";
    primaryCarePhysician = json['primaryCarePhysician'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ethnicity'] = ethnicity;
    _data['state'] = state;
    _data['secondary_insurance'] = secondaryInsurance;
    _data['profile_pic_url'] = profilePicUrl;
    _data['first_name'] = firstName;
    _data['city'] = city;
    _data['notes'] = notes;
    _data['dob'] = dob;
    _data['disease_data'] = diseaseData.map((e) => e.toJson()).toList();
    _data['phone'] = phone;
    _data['medication'] = medication;
    _data['loved_oneid'] = lovedOneid;
    _data['last_name'] = lastName;
    _data['gender'] = gender;
    _data['relationshipid'] = relationshipid;
    _data['pharmacy'] = pharmacy;
    _data['primary_insurance'] = primaryInsurance;
    _data['zipcode'] = zipcode;
    _data['primary_care_physician'] = primaryCarePhysician;
    return _data;
  }
}

class DiseaseData {
  DiseaseData({
    required this.diseaseid,
    required this.diseaseName,
  });

  late final int diseaseid;
  late final String diseaseName;

  DiseaseData.fromJson(Map<String, dynamic> json) {
    diseaseid = json['diseaseid'];
    diseaseName = json['disease_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['diseaseid'] = diseaseid;
    _data['disease_name'] = diseaseName;
    return _data;
  }
}
