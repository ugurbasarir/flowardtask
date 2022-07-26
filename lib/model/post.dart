
class Post {
  final int id;
  final int userId;
  final String? title;
  final String? body;

  Post({required this.id, required this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body']);
  }
}
