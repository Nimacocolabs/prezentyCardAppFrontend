

import 'package:get/get.dart';
import 'package:prezenty_card_app/models/user_details_reponse.dart';
import 'package:prezenty_card_app/models/user_signup_response.dart';
import 'package:prezenty_card_app/screens/splash_screen.dart';
import 'package:prezenty_card_app/utils/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _preferences;
  static String spToken = 'spToken';
  static String spUserId = 'spUserId';
  static String spEmail = 'spEmail';
  static String spName = 'spName';
  static String spMobile = 'spMobile';
  static String spRole = 'spRole';
  static String spStoreId='spStoreId';
  static String spEmpId='spEmpId';
  static String spUserImageUrl = 'spUserImageUrl';

  static init() async {
    _preferences = await SharedPreferences.getInstance();

    UserDetails.set(
        getString(spToken),
        getString(spUserId),
        getString(spName),
        getString(spEmail),
        getString(spMobile),
        getString(spRole),
        getString(spStoreId),
        getString(spEmpId),
        getString(spUserImageUrl));
  }

  static String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static Future<bool> logIn(UserSignupResponse response) async {
    if (response.user == null) return false;

    String token = response.token ?? UserDetails.apiToken;
    User user = response.user!;
print("->${token}");
    print("->${user.phone}");
    print("->${user.email}");
    await setString(spToken, '$token');
    await setString(spUserId, '${user.id ?? ''}');
    await setString(spEmail, '${user.email ?? ''}');
    await setString(spName, '${user.name ?? ''}');
    await setString(spMobile, '${user.phone ?? ''}');
    await setString(spRole, '${user.role ?? ''}');
    await setString(spStoreId,'${user.storeId ?? ''}');
    await setString(spEmpId,'${user.employeeId ?? ''}');
    await setString(spUserImageUrl, '${"" ?? ''}');

    UserDetails.set(
        token,
        '${user.id ?? ''}',
        '${user.name ?? ''}',
        '${user.email ?? ''}',
        '${user.phone ?? ''}',
        '${user.role ?? ''}',
        '${user.storeId ?? ''}',
        '${user.employeeId ?? ''}',
        '${"" ?? ''}');
    return true;
  }

  static Future<bool> logOut() async {
    await _preferences.clear();
    UserDetails.set('', '', '', '', '', '', '', '', '');

    Get.offAll(() => SplashScreen(isFromLogout: true));
    return true;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }
}


