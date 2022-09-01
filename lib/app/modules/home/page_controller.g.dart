// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$postsAtom =
      Atom(name: '_HomeControllerBase.posts', context: context);

  @override
  List<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$listarPostsAsyncAction =
      AsyncAction('_HomeControllerBase.listarPosts', context: context);

  @override
  Future<dynamic> listarPosts() {
    return _$listarPostsAsyncAction.run(() => super.listarPosts());
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
