import 'package:esig_utils/size_screen.dart';
import 'package:esig_utils/status_auth.dart';
import 'package:exemplo/app/modules/autenticacao/autenticacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  AutenticacaoController autenticacaoController = Modular.get();
  bool validateUser = false;
  bool validatePasswd = false;
  String usuario = '';
  String senha = '';

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(37, 76, 0, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imageBuilder(),
            const SizedBox(
              height: 90,
            ),
            _inputBuilder(),
            const SizedBox(
              height: 20,
            ),
            //const SizedBox(height: 30),
            _buttonBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _imageBuilder() {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeScreen.fracHeight(context, 4),
        left: SizeScreen.fracHeight(context, 16),
        right: SizeScreen.fracHeight(context, 16),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/delta-white.png',
            width: 65,
            height: 65,
          ),
        ],
      ),
    );
  }

  Widget _buttonBuilder(BuildContext context) {
    return Observer(
      builder: (_) {
        if (autenticacaoController.statusLogin != StatusLogin.AGUARDANDO) {
          return _button(context);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _button(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          key: const Key('login_button'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 38, 75, 129),
            ),
          ),
          onPressed: () async {
            if (_loginController.value.text.isNotEmpty &&
                _senhaController.value.text.isNotEmpty) {
              FocusScope.of(context).unfocus();
              if (await autenticacaoController.login(
                      _loginController.value.text,
                      _senhaController.value.text) ==
                  false) {
                setState(() {
                  validateUser = true;
                  validatePasswd = true;
                });
              }
            } else if (_loginController.value.text.isEmpty) {
              setState(() {
                validateUser = true;
              });
            } else if (_senhaController.value.text.isEmpty) {
              setState(() {
                validatePasswd = true;
              });
            }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  Widget _inputBuilder() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: SizeScreen.fracHeight(context, 16),
              right: SizeScreen.fracHeight(context, 16)),
          child: TextField(
            controller: _loginController,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Usuário',
              errorText: validateUser ? 'email inválido' : null,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              labelStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: SizeScreen.fracHeight(context, 16),
            right: SizeScreen.fracHeight(context, 16),
          ),
          child: TextField(
            controller: _senhaController,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            obscureText: autenticacaoController.show,
            onChanged: (text) {
              senha = text;
            },
            decoration: InputDecoration(
              labelText: 'Senha',
              errorText: validatePasswd ? 'senha inválida' : null,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              labelStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(
                Icons.security,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: autenticacaoController.show
                      ? Colors.grey
                      : const Color.fromARGB(255, 38, 75, 129),
                ),
                onPressed: () {
                  setState(() => autenticacaoController.show =
                      !autenticacaoController.show);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  //onPressedLogin() {}
}
