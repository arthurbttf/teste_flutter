import 'package:exemplo/app/modules/autenticacao/autenticacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  autenticacaoController controller = Modular.get();
  //List<List<String>> usrRegister = [];
  String usuario = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text('heççp'),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 60, right: 60, bottom: 20),
            child: TextField(
              //style: TextStyle(color: Colors.white),
              obscureText: false,
              onChanged: (text) {
                usuario = text;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Usuário',
                errorText:
                    controller.validateUser ? 'Usuário não encontrado' : null,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 60, right: 60, bottom: 20),
            child: TextField(
              obscureText: controller.show,
              onChanged: (text) {
                senha = text;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.security),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: controller.show ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {
                    setState(() => controller.show = !controller.show);
                  },
                ),
                labelText: 'Senha',
                errorText:
                    controller.validatePasswd ? 'Senha não encontrada' : null,
                //suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: setState(() => showPasswd = !showpassW),),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // for (int i = 0; i < userBase.length; i++) {
                  //   if (userBase[i].contains(usuario) &&
                  //       userBase[i].contains(senha)) {
                  //     Modular.to.pushNamed('/todo');
                  //   }
                  // }
                  //find(usuario, senha);
                },
                child: const Text('Login'),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  if (usuario == '' && senha == '') {
                    setState(() {
                      controller.validateUser = true;
                      controller.validatePasswd = true;
                    });
                  } else if (usuario == '') {
                    setState(() {
                      controller.validateUser = true;
                    });
                  } else if (senha == '') {
                    setState(() {
                      controller.validatePasswd = true;
                    });
                  } else {
                    setState(() {
                      controller.validateUser =
                          controller.validatePasswd = false;
                    });
                  }
                },
                child: const Text('Increver-se'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
