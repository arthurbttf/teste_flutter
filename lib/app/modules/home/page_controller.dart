import 'package:exemplo/app/modules/home/repositories/repository.dart';
import 'package:exemplo/app/models/post_model.dart';
import 'package:mobx/mobx.dart';

part 'page_controller.g.dart';

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