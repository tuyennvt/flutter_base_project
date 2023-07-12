import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/core/post.dart';
import '../../infrastructure/post/post_repo.dart';
import 'main_state.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>((ref) {
  return MainNotifier(ref.watch(postRepoProvider));
});

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier(this.postRepo) : super(const MainState());

  final PostRepo postRepo;

  Future<void> initialize() async {
    try {
      state = state.copyWith(posts: const AsyncValue.loading());
      List<Post> posts = await postRepo.getPosts();
      state = state.copyWith(posts: AsyncValue.data(posts));
    } catch (error, stackTrace) {
      state = state.copyWith(posts: AsyncValue.error(error, stackTrace));
    }
  }
}
