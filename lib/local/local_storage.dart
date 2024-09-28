import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/post.dart'; // Import the Post model

class LocalStorage {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('demo_app.db');
    return _database!;
  }

  // Initialize the SQLite database and create the 'posts' table
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        '''
        CREATE TABLE posts(
          id TEXT PRIMARY KEY,
          title TEXT,
          content TEXT,
          username TEXT,
          imageUrl TEXT,
          likes INTEGER,
          comments INTEGER,
          category TEXT
        )
        ''',
      );
    });
  }

  // Store posts in the SQLite database
  Future<void> storePosts(List<Post> posts) async {
    final db = await database;

    for (var post in posts) {
      await db.insert(
        'posts',
        post.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Retrieve stored posts from the SQLite database
  Future<List<Post>> getStoredPosts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');

    // Convert the map into a list of Post objects
    return List.generate(maps.length, (i) {
      return Post(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
        username: maps[i]['username'],
        imageUrl: maps[i]['imageUrl'],
        likes: maps[i]['likes'],
        comments: maps[i]['comments'],
        category: maps[i]['category'],
      );
    });
  }

  // Clear all posts from the database (optional utility method)
  Future<void> clearPosts() async {
    final db = await database;
    await db.delete('posts');
  }
}
