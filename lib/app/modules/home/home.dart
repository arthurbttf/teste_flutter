import 'package:esig_utils/size_screen.dart';
import 'package:exemplo/app/app_store.dart';
import 'package:exemplo/app/models/gasto.dart';
import 'package:exemplo/app/modules/home/home_controller.dart';
import 'package:exemplo/app/modules/home/widgets/listar_gastos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_empty_error/error_widget.dart';
import 'package:loading_empty_error/loading_widget.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  AppStore controller = Modular.get();
  HomeController homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(37, 76, 0, 255),
      body: ListView.builder(
        itemBuilder: (BuildContext, index) {
          return Card(
            child: ListTile(
              title: Text(homeController.categoria[index].nome),
              onTap: () {},
            ),
          );
        },
        itemCount: homeController.categoria.length,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildAboutDialog(context);
              });
        },
        label: const Text('Adicionar gasto'),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
      appBar: AppBar(
        title: const Text(
          'Lista de posts',
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _inputBuilder() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: _buildDropDown(),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            controller: _nomeController,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              labelText: 'Nome do gasto',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextField(
            controller: _valorController,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              labelText: 'Valor do gasto',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        _buttonBuilder(),
      ],
    );
  }

  Widget _buttonBuilder() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            homeController.categoria.add(Categoria(gasto: [
              Gasto(
                nome: 'moto',
                valor: _valorController.toString(),
              )
            ], nome: _categoriaController.toString()));
          });
        },
        child: const Text('Done'));
  }

  Widget _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(37, 76, 0, 255),
      title: const Text(
        'Insira seu gasto',
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_inputBuilder()],
      ),
    );
  }

  Widget _buildPostsPage() {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text(homeController.categoria.length.toString()),
          ),
        )
      ],
    );
  }

  Widget _buildDropDown() {
    const List<String> list = ['Moto', 'Almoço', 'Aleatório', 'Quilometragem'];
    String dropdownValue = list.first;
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
