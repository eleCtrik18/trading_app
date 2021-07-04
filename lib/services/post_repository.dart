import 'package:trading_app/services/post.dart';
import 'package:trading_app/services/posts_service.dart';

class PostsRepository {
  final PostsService service;

  PostsRepository(this.service);

  Future<List<Post>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);
    return posts.map((e) => Post.fromJson(e)).toList();
  }
}
