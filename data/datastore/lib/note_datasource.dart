import 'package:model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteDataSource {
  final String tableName = 'notes';
  late Future<Database> database = initDatabase(tableName);

  Future<void> delete(Note value) async {
    final db = await database;
    return db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [value.id],
    ).then((v) {
      if (v == 0) {
        throw Exception('No value was deleted');
      }
    });
  }

  Future<Database> initDatabase(String tableName) async {
    return openDatabase(
      join(await getDatabasesPath(), 'note.db'),
      onCreate: (db, version) async {
        return await db.execute(
          'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, summary TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insert(Note value) async {
    final db = await database;
    return db
        .insert(
      tableName,
      value.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    )
        .then((v) {
      if (v == 0) {
        throw Exception('No value was inserted');
      }
    });
  }

  Future<List<Note>?> queryAll() async {
    final db = await database;
    final List<Map<String, dynamic>> map = await db.query(tableName);
    return List.generate(
      map.length,
      (i) => Note.fromMap(map[i]),
    );
  }
}
