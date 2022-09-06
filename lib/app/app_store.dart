import 'package:exemplo/app/shared/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final prefs = SharedPrefs();

  void find() async {}

  @action
  void logout() async {
    prefs.remove();
    Modular.to.pushReplacementNamed('/');
  }
}
