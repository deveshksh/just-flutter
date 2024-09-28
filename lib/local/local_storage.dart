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

    return await openDatabase(
      path,
      version: 2, // Increment the version number due to schema change
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE posts(
            id TEXT PRIMARY KEY,
            title TEXT,
            content TEXT,
            username TEXT,
            userImageUrl TEXT,
            postImageUrl TEXT,
            likes INTEGER,
            comments INTEGER,
            category TEXT
          )
          ''',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // If upgrading from version 1 to 2, add new columns
          await db.execute("ALTER TABLE posts ADD COLUMN userImageUrl TEXT");
          await db.execute("ALTER TABLE posts ADD COLUMN postImageUrl TEXT");
          // Optionally, remove the old 'imageUrl' column if it exists
          // Note: SQLite does not support DROP COLUMN directly
        }
      },
    );
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
        id: maps[i]['id'] as String,
        title: maps[i]['title'] as String,
        content: maps[i]['content'] as String,
        username: maps[i]['username'] as String,
        userImageUrl: maps[i]['userImageUrl'] as String,
        postImageUrl: maps[i]['postImageUrl'] as String,
        likes: maps[i]['likes'] as int,
        comments: maps[i]['comments'] as int,
        category: maps[i]['category'] as String,
      );
    });
  }

  // Clear all posts from the database (optional utility method)
  Future<void> clearPosts() async {
    final db = await database;
    await db.delete('posts');
  }
}
