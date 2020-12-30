import 'package:shared_preferences/shared_preferences.dart';

Future<void> deleteUser() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  prefs = await _prefs;
  prefs.remove("CURRENT_USER");
}


Future<String> getUser() async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  prefs = await _prefs;
  return prefs.getString("CURRENT_USER");
}

Future<void> saveUser(int id) async {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  prefs = await _prefs;
  prefs.setString("CURRENT_USER", "$id");
}