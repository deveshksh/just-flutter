class Post {
  final String id;
  final String title;
  final String content;
  final String username;
  final String imageUrl;
  final int likes;
  final int comments;
  final String category;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.username,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.category,
  });

  // Convert a Post object into a map (to be stored in the database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'username': username,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'category': category,
    };
  }
}
