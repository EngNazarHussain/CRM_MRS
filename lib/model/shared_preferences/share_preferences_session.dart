import 'package:shared_preferences/shared_preferences.dart';

void saveSessionData(Map<String, dynamic> jsonData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', true);
  prefs.setString('message', jsonData['message'] ?? 'N/A');
  prefs.setString('token', jsonData['token'] ?? 'N/A');
  prefs.setString('first_name', jsonData['first_name'] ?? 'N/A');
  prefs.setString('last_name', jsonData['last_name'] ?? 'N/A');
  prefs.setString('email', jsonData['email'] ?? 'N/A');
  prefs.setString('phone', jsonData['phone'] ?? 'N/A');
  prefs.setString('user_type', jsonData['user_type'] ?? 'N/A');
  prefs.setString('avatar', jsonData['avatar'] ?? 'N/A');
  prefs.setInt('call_masking', jsonData['call_masking'] ?? 0);
  prefs.setInt('login_time', jsonData['login_time'] ?? 0);
}


Future<void> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await clearSharedPreferences();
  prefs.setBool('isLoggedIn', false);
}

Future<void> clearSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
