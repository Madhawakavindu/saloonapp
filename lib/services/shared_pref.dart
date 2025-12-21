import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {
  // KEYS
  static String userIdKey = "USERID";
  static String userNameKey = "USERNAME";
  static String userEmailKey = "USEREMAIL";

  // SAVE USER ID
  Future<void> saveUserId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userIdKey, id);
  }

  // SAVE USER NAME
  Future<void> saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userNameKey, name);
  }

  // SAVE USER EMAIL
  Future<void> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userEmailKey, email);
  }

  // GET USER ID
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  // GET USER NAME
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  // GET USER EMAIL
  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  // CLEAR ALL (LOGOUT)
  Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
