import 'package:exemplo/app/shared/shared_preferences.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

// ignore: library_private_types_in_public_api
class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final prefs = SharedPrefs();

  Future login() async {
    if (await prefs.find()) {
      Modular.to.pushReplacementNamed('/todo');
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }

  @action
  logout() async {
    prefs.remove();
    Modular.to.pushReplacementNamed('/login');
  }
}
