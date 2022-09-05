import 'package:exemplo/app/modules/home/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  HomeController controller = Modular.get();
  List<List<String>> usrRegister = [];
  List<List<String>> userBase = [
    ['arthur.beserra', 'EeYi%b0'],
    ['pubdev', 'flutter']
  ];
  String usuario = '';
  String senha = '';
  bool validateUser = false;
  bool validatePasswd = false;
  bool show = true;

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
                errorText: validateUser ? 'Usuário não encontrado' : null,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 60, right: 60, bottom: 20),
            child: TextField(
              obscureText: show,
              onChanged: (text) {
                senha = text;
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.security),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: show ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {
                    setState(() => show = !show);
                  },
                ),
                labelText: 'Senha',
                errorText: validatePasswd ? 'Senha não encontrada' : null,
                //suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: setState(() => showPasswd = !showpassW),),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < userBase.length; i++) {
                    if (userBase[i].contains(usuario) &&
                        userBase[i].contains(senha)) {
                      Modular.to.pushNamed('/todo');
                    }
                  }
                  setState(() {
                    validateUser = true;
                    validatePasswd = true;
                  });
                },
                child: const Text('Login'),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  //print(teste[1].contains('pubdev'));
                  if (usuario == '' && senha == '') {
                    setState(() {
                      validateUser = true;
                      validatePasswd = true;
                    });
                  } else if (usuario == '') {
                    setState(() {
                      validateUser = true;
                    });
                  } else if (senha == '') {
                    setState(() {
                      validatePasswd = true;
                    });
                  } else {
                    setState(() {
                      validateUser = validatePasswd = false;
                    });
                    usrRegister.add([usuario, senha]);
                    //print(usrRegister);
                    usrRegister.clear();
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
