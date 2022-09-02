import 'dart:js';

import 'package:dio/dio.dart';
import 'package:exemplo/app/modules/home/login_page.dart';
import 'package:exemplo/app/modules/home/page_controller.dart';
import 'package:exemplo/app/modules/home/post_page.dart';
import 'package:exemplo/app/modules/home/repositories/repository.dart';
import 'package:exemplo/app/modules/home/todo_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => PageRepository(i.get<Dio>())),
        Bind((i) => HomeController(i.get<PageRepository>()))
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => TodoListPage()),
    ChildRoute('/posts', child: (context, args) => PostPage()),
    ChildRoute('/login', child: (context, args) => LoginPage()),
  ];
}
