import 'package:esig_utils/status.dart';
import 'package:exemplo/app/modules/posts/post_controller.dart';
import 'package:exemplo/app/modules/posts/widgets/posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loading_empty_error/error_widget.dart';
import 'package:loading_empty_error/loading_indicator_type.dart';
import 'package:loading_empty_error/loading_widget.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostController controller = Modular.get();
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
          return _buildPostsPage();
        },
      ),
      //drawer: Drawer(),
      appBar: AppBar(
        title: const Text(
          'Lista de posts',
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

  Widget _buildPostsPage() {
    List<Widget> posts = listarPosts(controller, context);
    if (controller.statusPost == Status.AGUARDANDO) {
      return Center(
        child: EsigLoadingWidget(
          '',
          tamanhoIlustracao:
              const BoxConstraints(maxWidth: 140, maxHeight: 140),
          paddingIndicator: const EdgeInsets.all(20),
          loadingIndicator: LoadingIndicator.LINEAR,
          mensagemFontSize: 16,
          largura: MediaQuery.of(context).size.width / 2,
        ),
      );
    } else if (controller.statusPost == Status.ERRO) {
      return Center(
        child: EsigErrorWidget(
          'Erro ao carregar as postagens',
          tamanhoIlustracao:
              const BoxConstraints(maxWidth: 140, maxHeight: 140),
          titulo: 'Ops...',
          tituloFontSize: 20,
          mensagemFontSize: 16,
          corTexto: Colors.black,
          onTryAgain: () {
            controller.statusPost = Status.AGUARDANDO;
            controller.listarPosts();
          },
          tryAgainBackgroundColor: Colors.blue,
          tryAgainTextColor: Colors.black,
        ),
      );
    } else if (controller.statusPost == Status.CONCLUIDO) {
      return ListView(
        children: posts,
      );
    }
    return const Center();
  }

  List<Widget> listarPosts(PostController controller, BuildContext context) {
    return controller.posts.map((e) => PostWidget(post: e)).toList();
  }
}
