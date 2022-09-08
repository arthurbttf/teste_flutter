import 'package:exemplo/app/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
part 'autenticacao_controller.g.dart';

// ignore: library_private_types_in_public_api
class AutenticacaoController = _AutenticacaoControllerBase
    with _$AutenticacaoController;

abstract class _AutenticacaoControllerBase with Store {
  AppStore appStore = Modular.get();

  bool show = true;
  //String loginKey = '';
  Future register(String name, String pass) async {
    await appStore.prefs.save(name, pass);
  }
}
