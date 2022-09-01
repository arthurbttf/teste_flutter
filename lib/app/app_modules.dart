import 'package:exemplo/app/modules/home/todo_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  //@override
  //List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => TodoListPage()),
  ];
}
