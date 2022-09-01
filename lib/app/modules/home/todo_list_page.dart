import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer'),
            ),
            ListTile(
              title: Text('ir para segunda página'),
              onTap: () {
                Modular.to.pushNamed('/posts');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Lista de tarefas',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                separatorBuilder: ((context, index) => const Divider()),
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "tag1",
            backgroundColor: Colors.black,
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear();
              }
              //print(tarefas);
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "tag2",
            backgroundColor: Colors.black,
            onPressed: () {
              setState(() {
                tarefas = [];
              });
              //_textEditingController.clear();
              //print(tarefas);
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
