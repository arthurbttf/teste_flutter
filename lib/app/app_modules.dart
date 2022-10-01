import 'package:dio/dio.dart';
import 'package:exemplo/app/app_store.dart';
import 'package:exemplo/app/modules/autenticacao/autenticacao_controller.dart';
import 'package:exemplo/app/modules/autenticacao/login_page.dart';
import 'package:exemplo/app/modules/autenticacao/widget/loading.dart';
import 'package:exemplo/app/modules/home/home_controller.dart';
import 'package:exemplo/app/modules/posts/post_controller.dart';
import 'package:exemplo/app/modules/posts/post_page.dart';
import 'package:exemplo/app/modules/posts/repositories/repository.dart';
import 'package:exemplo/app/modules/home/home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => PageRepository(i.get<Dio>())),
        Bind((i) => PostController(i.get<PageRepository>())),
        Bind((i) => AutenticacaoController()),
        Bind((i) => HomeController(i.get<PageRepository>())),
        Bind((i) => AppStore()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/todo', child: (context, args) => const TodoListPage()),
    //ChildRoute('/posts', child: (context, args) => const PostPage()),
    ChildRoute('/login', child: (context, args) => const LoginPage()),
    ChildRoute('/', child: (context, args) => const Loading()),
  ];
}
