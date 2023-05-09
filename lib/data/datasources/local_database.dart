import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static const _databaseName = "my_app.db";
  static const _databaseVersion = 1;

  Future<Database> get db async {
    final path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, content TEXT)''');
  }
}
