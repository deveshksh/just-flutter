import 'dart:convert';

class ApiService {
  static Future<List<Post>> fetchPosts(int page) async {
    // Manually adding 20 demo posts for the sake of this demo with images, likes, comments, and categories
    List<Map<String, dynamic>> demoPosts = [
      {'id': '1', 'title': 'Getting Started with Flutter', 'content': 'Learn the basics of Flutter', 'username': 'ArneoParis', 'imageUrl': 'https://via.placeholder.com/400', 'likes': 120, 'comments': 30, 'category': 'Development'},
      {'id': '2', 'title': 'State Management in Flutter', 'content': 'Explore Provider, Riverpod, and more', 'username': 'DevExpert', 'imageUrl': 'https://via.placeholder.com/400', 'likes': 230, 'comments': 40, 'category': 'Development'},
      // Add more posts here...
    ];

    // Simulate delay
    await Future.delayed(Duration(seconds: 2));

    // Convert map to Post model
    List<Post> posts = demoPosts.map((postMap) => Post.fromJson(postMap)).toList();
    return posts;
  }
}

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

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id']!,
      title: json['title']!,
      content: json['content']!,
      username: json['username']!,
      imageUrl: json['imageUrl']!,
      likes: json['likes']!,
      comments: json['comments']!,
      category: json['category']!,
    );
  }

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
