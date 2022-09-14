import 'package:esig_utils/status.dart';
import 'package:exemplo/app/models/post_model.dart';
import 'package:exemplo/app/modules/posts/repositories/repository.dart';
// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';
part 'post_controller.g.dart';

// ignore: library_private_types_in_public_api
class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  final PageRepository _pageRepository;
  _PostControllerBase(this._pageRepository);

  @observable
  List<PostModel> posts = [];

  @observable
  Status statusPost = Status.NAO_CARREGADO;

  @action
  Future listarPosts() async {
    statusPost = Status.AGUARDANDO;
    try {
      posts = await _pageRepository.getPosts();
      statusPost = Status.CONCLUIDO;
    } on Exception catch (_) {
      statusPost = Status.ERRO;
    }
  }
}
