import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/core/post.dart';
import '../datasource/remote/dio_client.dart';

final postRepoProvider = Provider<PostRepo>((ref) {
  return PostRepo(ref.watch(dioClientProvider));
});

class PostRepo {
  PostRepo(this.dioClient);

  final DioClient dioClient;

  Future<List<Post>> getPosts() async {
    try {
      dynamic response = await dioClient.get(path: 'posts');
      List<dynamic> list = response;
      List<Post> data = list.map((e) => Post.fromJson(e)).toList();
      return data;
    } catch (error, stackTrace) {
      log(
        'Error',
        name: 'PostRepo.getPosts',
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
