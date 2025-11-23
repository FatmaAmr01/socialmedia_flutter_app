class PostModel {
  final List<Post> posts;

  PostModel({required this.posts});

  factory PostModel.fromjson({required Map<String, dynamic> json}) {
    List<Post> temp = json['results'].map((post) {
      return Post(
        userName: post['userName'] ?? "",
        content: post['content'] ?? "",
        createdAt: post['createdAt'] ?? "",
        id: post['id'] ?? 0,
      );
    }).toList();
    return PostModel(posts: temp);
  }
}

class Post {
  final String userName;
  final String content;
  final String createdAt;
  final int id;

  Post({
    required this.userName,
    required this.content,
    required this.createdAt,
    required this.id,
  });
}
