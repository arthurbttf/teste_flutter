import 'dart:math';

import 'package:exemplo/app/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'autenticacao_controller.g.dart';

class autenticacaoController = _autenticacaoControllerBase
    with _$autenticacaoController;

abstract class _autenticacaoControllerBase with Store {
  AppStore appStore = Modular.get();
  bool validateUser = false;
  bool validatePasswd = false;
  bool show = true;
  //String loginKey = '';
  Future login(String name, String pass) async {
    await appStore.prefs.save(name, pass);
  }
}
