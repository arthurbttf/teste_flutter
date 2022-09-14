import 'package:exemplo/app/modules/posts/repositories/repository.dart';
import 'package:exemplo/app/models/post_model.dart';
// ignore: depend_on_referenced_packages
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

// ignore: library_private_types_in_public_api
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PageRepository _pageRepository;
  _HomeControllerBase(this._pageRepository);

  @observable
  List<PostModel> posts = [];
  String teste = 'test';

  @action
  Future listarPosts() async {
    posts = await _pageRepository.getPosts();
  }
}

//singleton