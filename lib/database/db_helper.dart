
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'imc_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            email TEXT PRIMARY KEY,
            senha TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert('users', user.toMap());
  }

  Future<User?> getUser(String email) async {
    final db = await database;
    final maps = await db.query('users',
        where: 'email = ?', whereArgs: [email], limit: 1);
    if (maps.isNotEmpty) return User.fromMap(maps.first);
    return null;
  }
}
