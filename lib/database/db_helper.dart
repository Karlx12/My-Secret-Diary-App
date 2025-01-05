import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'diary.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pages(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pageNumber INTEGER,
        content TEXT,
        title TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE titles(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        timestamp TEXT,
        pageId INTEGER,
        FOREIGN KEY(pageId) REFERENCES pages(id)
      )
    ''');
  }

  Future<void> dropTablesAndRecreate() async {
    final db = await database;
    await db.execute('DROP TABLE IF EXISTS pages');
    await db.execute('DROP TABLE IF EXISTS titles');
    await _onCreate(db, 1);
  }
}