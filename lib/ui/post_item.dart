import 'package:flutter/material.dart';
import 'package:demo_app/models/post.dart';
import 'package:flutter_share/flutter_share.dart';

class PostItem extends StatelessWidget {
  final Post post;

  PostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.userImageUrl),
            ),
            title: Text(post.username),
            subtitle: Text('Category: ${post.category}'),
          ),
          // Main post image
          Image.network(
            post.postImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Text('Image not available');
            },
          ),
          // Post title and content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.content),
          ),
          // Interaction buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Likes
                Row(
                  children: [
                    Icon(Icons.thumb_up),
                    SizedBox(width: 4),
                    Text('${post.likes} Likes'),
                  ],
                ),
                // Comments
                Row(
                  children: [
                    Icon(Icons.comment),
                    SizedBox(width: 4),
                    Text('${post.comments} Comments'),
                  ],
                ),
                // Share button
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    _sharePost(post.title, post.content);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Share function
  Future<void> _sharePost(String title, String content) async {
    await FlutterShare.share(
      title: title,
      text: content,
      chooserTitle: 'Share Post',
    );
  }
}
