
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_sync_content_app/models/post.dart';

void main() {
  group('Post Model Tests', () {
    test('Post should convert to JSON and back correctly', () {
      final post = Post(
        id: 1,
        userId: 121,
        title: 'Sample Study Post',
        body: 'This is a sample post description.',
      );

      final json = post.toJson();
      final restoredPost = Post.fromJson(json);

      expect(restoredPost.id, 1);
      expect(restoredPost.userId, 121);
      expect(restoredPost.title, 'Sample Study Post');
      expect(
        restoredPost.body,
        'This is a sample post description.',
      );
    });
  });
}
