// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:exemplo/app/models/post_model.dart';

class PageRepository {
  final Dio dio;
  PageRepository(this.dio);

  Future<List<PostModel>> getPosts() async {
    final Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    final post =
        (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    return post;
  }
}
