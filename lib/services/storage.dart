import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  static Future<bool> saveUser(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('data', data);
    return prefs.commit();
  }

  static Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString('data');
    return data;
  }

}