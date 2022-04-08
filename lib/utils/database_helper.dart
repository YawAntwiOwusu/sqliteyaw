import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqliteyaw/models/user_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        first_name TEXT,
        last_name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database db = await instance.database;
    return await db.insert(
      'user',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<User> getUser() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query('user', where: 'id = ?', whereArgs: [1]);
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(
        firstName: '',
        lastName: '',
        email: '',
        password: '',
      );
    }
  }
}
