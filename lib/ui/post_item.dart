import 'package:flutter/material.dart';
import 'package:demo_app/models/post.dart';  // Import the Post model
import 'package:flutter_share/flutter_share.dart';  // Import a package to handle sharing (if needed)

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
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.imageUrl),
            ),
            title: Text(post.username),
            subtitle: Text('Category: ${post.category}'),
          ),
          Image.network(post.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.content),
          ),
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
