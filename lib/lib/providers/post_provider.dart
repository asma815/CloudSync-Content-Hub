
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';
import '../services/post_service.dart';

class PostProvider extends ChangeNotifier {
  final PostService _service = PostService();

  List<Post> posts = [];
  bool isLoading = false;
  bool isOffline = false;
  String? errorMessage;

  static const String cacheKey = 'cached_posts_v2';

  Future<void> loadPosts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Load previously saved posts first.
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString(cacheKey);

      if (cachedData != null && posts.isEmpty) {
        final List<dynamic> decoded = jsonDecode(cachedData);
        posts = decoded
            .map((item) => Post.fromJson(item))
            .toList();
        isOffline = true;
        notifyListeners();
      }
    } catch (_) {
      // Continue and try fetching fresh data.
    }

    // Fetch fresh posts from the remote API.
    try {
      final freshPosts = await _service.fetchPosts();

      posts = freshPosts;
      isOffline = false;

      final prefs = await SharedPreferences.getInstance();
      final encodedData = jsonEncode(
        freshPosts.map((post) => post.toJson()).toList(),
      );

      await prefs.setString(cacheKey, encodedData);
    } catch (_) {
      isOffline = true;

      if (posts.isEmpty) {
        errorMessage =
            'Unable to load content. Please check your internet connection.';
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
