import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/page_diary.dart';

class PageRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> insertPage(PageDiary page) async {
    final db = await _databaseHelper.database;
    await db.insert('pages', page.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<PageDiary>> getPages() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('pages');
    return List.generate(maps.length, (i) {
      return PageDiary.fromJson(maps[i]);
    });
  }
}