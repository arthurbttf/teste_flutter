// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @action
  Future listarPosts() async {
    posts = await _pageRepository.getPosts();
  }
}
