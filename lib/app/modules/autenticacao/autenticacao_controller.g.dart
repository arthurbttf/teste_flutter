// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AutenticacaoController on _AutenticacaoControllerBase, Store {
  late final _$statusLoginAtom =
      Atom(name: '_AutenticacaoControllerBase.statusLogin', context: context);

  @override
  StatusLogin get statusLogin {
    _$statusLoginAtom.reportRead();
    return super.statusLogin;
  }

  @override
  set statusLogin(StatusLogin value) {
    _$statusLoginAtom.reportWrite(value, super.statusLogin, () {
      super.statusLogin = value;
    });
  }

  late final _$showAtom =
      Atom(name: '_AutenticacaoControllerBase.show', context: context);

  @override
  bool get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  @override
  String toString() {
    return '''
statusLogin: ${statusLogin},
show: ${show}
    ''';
  }
}
