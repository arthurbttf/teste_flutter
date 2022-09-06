import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences prefs;

  Future<bool> save(String name, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('0', [name, pass]);
  }

  Future<bool> remove() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove('0');
  }
}
