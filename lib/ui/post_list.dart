import 'package:flutter/material.dart';
import 'package:demo_app/models/post.dart';  // Import the Post model
import 'package:demo_app/ui/post_item.dart';  // Import the PostItem widget
import 'package:demo_app/widgets/search_bar.dart';


class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  // Hardcoded list of posts
  List<Post> _posts = [
  Post(
    id: '1',
    title: 'Getting Started with Flutter',
    content: 'Learn the basics of Flutter development.',
    username: 'John Doe',
    userImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum1/800/600',
    likes: 120,
    comments: 30,
    category: 'Development',
  ),
  Post(
    id: '2',
    title: 'State Management in Flutter',
    content: 'Explore Provider, Riverpod, and other state management tools.',
    username: 'Jane Smith',
    userImageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum2/800/600',
    likes: 230,
    comments: 40,
    category: 'Development',
  ),
  Post(
    id: '3',
    title: 'Best Practices for UI Design',
    content: 'Design beautiful and efficient Flutter apps.',
    username: 'Mike Johnson',
    userImageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum3/800/600',
    likes: 300,
    comments: 50,
    category: 'Design',
  ),
  Post(
    id: '4',
    title: 'Animations in Flutter',
    content: 'Learn how to add smooth animations to your Flutter apps.',
    username: 'Anna Brown',
    userImageUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum4/800/600',
    likes: 340,
    comments: 60,
    category: 'Design',
  ),
  Post(
    id: '5',
    title: 'Networking in Flutter',
    content: 'Using http and dio for network requests in your Flutter app.',
    username: 'Chris Evans',
    userImageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum5/800/600',
    likes: 200,
    comments: 44,
    category: 'Development',
  ),
  Post(
    id: '6',
    title: 'Firebase Integration',
    content: 'How to integrate Firebase with Flutter apps.',
    username: 'Sara Wilson',
    userImageUrl: 'https://randomuser.me/api/portraits/women/6.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum6/800/600',
    likes: 400,
    comments: 120,
    category: 'Backend',
  ),
  Post(
    id: '7',
    title: 'Using SQLite for Offline Storage',
    content: 'Learn how to store data offline with SQLite in Flutter.',
    username: 'Tom Baker',
    userImageUrl: 'https://randomuser.me/api/portraits/men/7.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum7/800/600',
    likes: 150,
    comments: 35,
    category: 'Backend',
  ),
  Post(
    id: '8',
    title: 'Building Custom Widgets',
    content: 'How to create reusable custom widgets in Flutter.',
    username: 'Lucy White',
    userImageUrl: 'https://randomuser.me/api/portraits/women/8.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum8/800/600',
    likes: 210,
    comments: 25,
    category: 'Development',
  ),
  Post(
    id: '9',
    title: 'Testing in Flutter',
    content: 'Learn how to write unit and widget tests for your app.',
    username: 'Mark Green',
    userImageUrl: 'https://randomuser.me/api/portraits/men/9.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum9/800/600',
    likes: 180,
    comments: 33,
    category: 'Development',
  ),
  Post(
    id: '10',
    title: 'Building Responsive UIs',
    content: 'Design Flutter apps that work well on all screen sizes.',
    username: 'Emma Blue',
    userImageUrl: 'https://randomuser.me/api/portraits/women/10.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum10/800/600',
    likes: 160,
    comments: 20,
    category: 'Design',
  ),
  Post(
    id: '11',
    title: 'Using GraphQL in Flutter',
    content: 'How to fetch data using GraphQL in Flutter apps.',
    username: 'John Silver',
    userImageUrl: 'https://randomuser.me/api/portraits/men/11.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum11/800/600',
    likes: 110,
    comments: 15,
    category: 'Backend',
  ),
  Post(
    id: '12',
    title: 'Flutter for Web',
    content: 'Deploying Flutter apps on the web.',
    username: 'Sophia Grey',
    userImageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum12/800/600',
    likes: 250,
    comments: 55,
    category: 'Development',
  ),
  Post(
    id: '13',
    title: 'Push Notifications in Flutter',
    content: 'Implementing push notifications in Flutter apps.',
    username: 'Jack Blue',
    userImageUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum13/800/600',
    likes: 330,
    comments: 80,
    category: 'Backend',
  ),
  Post(
    id: '14',
    title: 'Flutter for Desktop',
    content: 'Developing desktop applications using Flutter.',
    username: 'Alice Red',
    userImageUrl: 'https://randomuser.me/api/portraits/women/14.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum14/800/600',
    likes: 180,
    comments: 40,
    category: 'Development',
  ),
  Post(
    id: '15',
    title: 'Migrating to Flutter 2',
    content: 'Learn how to migrate your project to Flutter 2.',
    username: 'David Black',
    userImageUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum15/800/600',
    likes: 290,
    comments: 70,
    category: 'Development',
  ),
  Post(
    id: '16',
    title: 'Creating Smooth Animations',
    content: 'Build animations in Flutter to enhance UX.',
    username: 'Olivia Yellow',
    userImageUrl: 'https://randomuser.me/api/portraits/women/16.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum16/800/600',
    likes: 120,
    comments: 25,
    category: 'Design',
  ),
  Post(
    id: '17',
    title: 'GraphQL Mutations in Flutter',
    content: 'How to perform GraphQL mutations in Flutter apps.',
    username: 'Chris Brown',
    userImageUrl: 'https://randomuser.me/api/portraits/men/17.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum17/800/600',
    likes: 340,
    comments: 100,
    category: 'Backend',
  ),
  Post(
    id: '18',
    title: 'Building Authentication Flows',
    content: 'Secure your Flutter apps with proper authentication.',
    username: 'Ava White',
    userImageUrl: 'https://randomuser.me/api/portraits/women/18.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum18/800/600',
    likes: 300,
    comments: 45,
    category: 'Backend',
  ),
  Post(
    id: '19',
    title: 'Performance Optimization',
    content: 'Improve the performance of your Flutter apps.',
    username: 'Nick Green',
    userImageUrl: 'https://randomuser.me/api/portraits/men/19.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum19/800/600',
    likes: 270,
    comments: 50,
    category: 'Development',
  ),
  Post(
    id: '20',
    title: 'Deploying Flutter Apps',
    content: 'Guide to deploying Flutter apps to Play Store.',
    username: 'Isabella Silver',
    userImageUrl: 'https://randomuser.me/api/portraits/women/20.jpg',
    postImageUrl: 'https://picsum.photos/seed/picsum20/800/600',
    likes: 380,
    comments: 90,
    category: 'Development',
  ),
];


  List<Post> _filteredPosts = [];
  // bool _isLoading = false;
  String _searchTerm = '';
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredPosts = _posts;
  }

  void _filterPosts() {
    List<Post> filtered = _posts.where((post) {
      bool matchesSearch = post.title.toLowerCase().contains(_searchTerm.toLowerCase()) ||
          post.username.toLowerCase().contains(_searchTerm.toLowerCase()) ||
          post.category.toLowerCase().contains(_searchTerm.toLowerCase());

      bool matchesCategory = _selectedCategory == 'All' || post.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    setState(() {
      _filteredPosts = filtered;
    });
  }

   // Add the _showFilterDialog method here
  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tempSelectedCategory = _selectedCategory;
        return AlertDialog(
          title: Text('Select Category'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return DropdownButton<String>(
                value: tempSelectedCategory,
                items: <String>['All', 'Development', 'Design', 'Marketing']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    tempSelectedCategory = newValue!;
                  });
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedCategory = tempSelectedCategory;
                });
                _filterPosts();
                Navigator.of(context).pop();
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      // Search bar with filter button
      CustomSearchBarWithFilter(
        onSearch: (value) {
          setState(() {
            _searchTerm = value;
          });
          _filterPosts();
        },
        onFilterTap: () {
          _showFilterDialog();
        },
      ),
      Expanded(
        child: ListView.builder(
          itemCount: _filteredPosts.length,
          itemBuilder: (context, index) {
            return PostItem(post: _filteredPosts[index]);
          },
        ),
      ),
    ],
  );
}
}
