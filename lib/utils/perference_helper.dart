import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contants.dart';

class PreferenceHelper {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static setPreferenceValue(String keyPair, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(Constants.mpin, value);
    }
    if (value is int) {
      await prefs.setInt(Constants.mpin, value);
    }
    if (value is double) {
      await prefs.setDouble(Constants.mpin, value);
    }
    if (value is String) {
      await prefs.setString(Constants.mpin, value);
    }
  }


  static Future<dynamic> getPreference(String keyPair) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(keyPair);
  }

  static setLoginStatus(bool? isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isLogin is bool) {
      await prefs.setBool(SharedPrefKeys.isLogin, isLogin);
    }
  }

  static setSessionToken(String? session) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (session is String) {
      await prefs.setString(SharedPrefKeys.sessionToken, session);
    }
  }

  static setUserName(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(SharedPrefKeys.userName, value);
    }
  }

  static setUserId(int? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await prefs.setInt(SharedPrefKeys.userId, value);
    }
  }

  static setUserName1(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(SharedPrefKeys.userName1, value);
    }
  }

  static setImage(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(SharedPrefKeys.image, value);
    }
  }

  static Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.isLogin) ?? false;
  }

  static Future<String> getSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.sessionToken) ?? '';
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.userName) ?? '';
  }

  static Future<String> getUserName1() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.userName1) ?? '';
  }

  static Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPrefKeys.userId) ?? 0;
  }

  static Future<String> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.image) ?? '';
  }

  static Future<bool> getLoginDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.getTrack) ?? false;
  }

  static setTrack(bool status) async {
    // obtain shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constants.getTrack, status);
  }
}

clearPreference() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
