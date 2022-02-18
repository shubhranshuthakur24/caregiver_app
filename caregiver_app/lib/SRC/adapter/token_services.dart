import 'package:shared_preferences/shared_preferences.dart';

class TokenServices {
  static late String firebaseUserId;
  static late String token;
  static late String userid;

  // static late String user_typeid;

  static Future tokenRead() async {
    final prefs = await SharedPreferences.getInstance();
    firebaseUserId = prefs.getString("FirebaseUserid").toString();
    token = prefs.getString("token").toString();
    userid = prefs.getString("userid").toString();
    // user_typeid = prefs.getString("user_typeid").toString();
  }

  static Future tokenSave({
    required String token,
    required String firebaseId,
    required int userid,
    // required int user_typeid
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setString('FirebaseUserid', firebaseId);
    prefs.setString('userid', userid.toString());
    // prefs.setString('user_typeid', user_typeid.toString());
  }

  static Future tokenDelete() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    firebaseUserId = "null";
    token = "null";
    userid = "null";
    // user_typeid = "null";
  }
}
