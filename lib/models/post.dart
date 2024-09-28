class Post {
  final String id;
  final String title;
  final String content;
  final String username;
  final String userImageUrl; // User's profile image
  final String postImageUrl; // Main post image
  final int likes;
  final int comments;
  final String category;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.username,
    required this.userImageUrl,
    required this.postImageUrl,
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
      'userImageUrl': userImageUrl,
      'postImageUrl': postImageUrl,
      'likes': likes,
      'comments': comments,
      'category': category,
    };
  }

  // Create a Post object from a map (retrieved from the database)
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      username: json['username'] as String,
      userImageUrl: json['userImageUrl'] as String,
      postImageUrl: json['postImageUrl'] as String,
      likes: json['likes'] as int,
      comments: json['comments'] as int,
      category: json['category'] as String,
    );
  }
}
