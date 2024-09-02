import 'package:shared_preferences/shared_preferences.dart';

void saveSessionData(Map<String, dynamic> jsonData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', true);
  prefs.setInt('status', jsonData['status']);
  prefs.setString('message', jsonData['message'] ?? 'N/A');
  prefs.setString('token', jsonData['token'] ?? 'N/A');
  prefs.setString('short_token', jsonData['short_token'] ?? 'N/A');
  prefs.setString('name', jsonData['name'] ?? 'N/A');
  prefs.setString('name_str', jsonData['name_str'] ?? 'N/A');
  prefs.setString('designation', jsonData['designation'] ?? 'N/A');
  prefs.setString('uid', jsonData['uid'] ?? 'N/A');
  prefs.setString('photo', jsonData['photo'] ?? 'N/A');
  prefs.setString('username', jsonData['username'] ?? 'N/A');
  prefs.setInt('usertype', jsonData['usertype']);
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
