import 'package:exemplo/app/modules/home/page_controller.dart';
import 'package:exemplo/app/modules/home/widgets/posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final HomeController controller = Modular.get();
  @override
  void initState() {
    controller.listarPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return ListView(
            children: PostWidget(post: e),
          );
        },
      ),
      //drawer: Drawer(),
      appBar: AppBar(
        title: const Text(
          'Lista de tarefas',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
