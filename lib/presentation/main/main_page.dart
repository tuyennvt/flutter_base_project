import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/main/main_notifier.dart';
import '../../domain/core/post.dart';
import '../widgets/empty_data_widget.dart';
import '../widgets/error_occurred_widget.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/';

  @override
  ConsumerState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mainProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ref.watch(mainProvider.select((value) => value.posts)).when(
        data: (List<Post> data) {
          if (data.isEmpty) {
            return EmptyDataWidget(
              onRetry: () {
                ref.read(mainProvider.notifier).initialize();
              },
            );
          }
          return PostListView(data);
        },
        error: (Object error, StackTrace stackTrace) {
          return ErrorOccurredWidget(
            msgError: error.toString(),
            onRetry: () {
              ref.read(mainProvider.notifier).initialize();
            },
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class PostListView extends ConsumerWidget {
  const PostListView(this.posts, {super.key});

  final List<Post> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        Post post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: posts.length,
    );
  }
}
