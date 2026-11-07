
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostService {
  static const String apiUrl =
      'https://dummyjson.com/posts?limit=30';

  Future<List<Post>> fetchPosts() async {
    final response = await http
        .get(Uri.parse(apiUrl))
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData =
          jsonDecode(response.body);

      final List<dynamic> data =
          responseData['posts'];

      return data.map((item) {
        return Post(
          id: item['id'],
          userId: item['userId'],
          title: item['title'],
          body: item['body'],
        );
      }).toList();
    } else {
      throw Exception('Unable to load posts');
    }
  }
}
