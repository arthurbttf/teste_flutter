import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences prefs;

  Future<bool> save(String name, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('0', [name, pass]);
  }

  Future<bool> find() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getKeys().contains('0')) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> remove() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove('0');
  }
}
