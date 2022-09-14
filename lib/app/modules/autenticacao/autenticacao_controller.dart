import 'package:esig_utils/status_auth.dart';
import 'package:exemplo/app/app_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
part 'autenticacao_controller.g.dart';

// ignore: library_private_types_in_public_api
class AutenticacaoController = _AutenticacaoControllerBase
    with _$AutenticacaoController;

abstract class _AutenticacaoControllerBase with Store {
  AppStore appStore = Modular.get();
  @observable
  StatusLogin statusLogin = StatusLogin.DESLOGADO;
  @observable
  bool show = true;

  Future<bool> login(String name, String pass) async {
    statusLogin = StatusLogin.AGUARDANDO;
    User? user = await appStore.firebaseLogin(name, pass);
    if (user != null) {
      register(name, pass);
      statusLogin = StatusLogin.LOGADO;
      Modular.to.pushReplacementNamed('/todo');
    }
    statusLogin = StatusLogin.DESLOGADO;
    return false;
  }

  Future register(String name, String pass) async {
    await appStore.prefs.save(name, pass);
  }
}
