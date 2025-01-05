import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/title_record.dart';

class TitleRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insertTitle(TitleRecord title) async {
    final db = await _databaseHelper.database;
    await db.insert('titles', title.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TitleRecord>> getTitles() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('titles');
    return List.generate(maps.length, (i) {
      return TitleRecord.fromJson(maps[i]);
    });
  }
}