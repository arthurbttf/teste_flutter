import 'package:exemplo/app/modules/home/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  HomeController controller = Modular.get();
  List<String> res = [];
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Usuário',
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 60, right: 60, bottom: 20),
            child: TextField(
              obscureText: true,
              onChanged: (text) {
                senha = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
                //suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: setState(() => showPasswd = !showpassW),),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: (MediaQuery.of(context).size.width / 2)),
              ElevatedButton(
                onPressed: () {
                  res.add(usuario);
                  res.add(senha);
                  //print(res);
                },
                child: Text('Login'),
              ),
              //SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text('Increver-se'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
