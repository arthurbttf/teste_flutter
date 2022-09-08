import 'package:exemplo/app/modules/autenticacao/autenticacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AutenticacaoController controller = Modular.get();
  bool validateUser = false;
  bool validatePasswd = false;
  String usuario = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(37, 76, 0, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 60, right: 60),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/delta-white.png',
                    width: 65,
                    height: 65,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 60, right: 60, bottom: 20),
              child: TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
                obscureText: false,
                onChanged: (text) {
                  usuario = text;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  labelText: 'Usuário',
                  errorText: validateUser ? 'Usuário não preenchido' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 60, right: 60, bottom: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                obscureText: controller.show,
                onChanged: (text) {
                  senha = text;
                },
                decoration: InputDecoration(
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
                      color: controller.show
                          ? Colors.grey
                          : const Color.fromARGB(255, 38, 75, 129),
                    ),
                    onPressed: () {
                      setState(() => controller.show = !controller.show);
                    },
                  ),
                  labelText: 'Senha',
                  errorText: validatePasswd ? 'Senha não preenchida' : null,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 38, 75, 129),
                    ),
                  ),
                  onPressed: () {
                    if (usuario == '' && senha == '') {
                      setState(() {
                        validateUser = true;
                        validatePasswd = true;
                      });
                    } else if (usuario == '') {
                      setState(() => validateUser = !validateUser);
                    } else if (senha == '') {
                      setState(() => validatePasswd = !validatePasswd);
                    } else {
                      controller.register(usuario, senha);
                      Modular.to.pushReplacementNamed('/todo');
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
