import 'package:model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/note_datasource.g.dart';

@riverpod
NoteDataSource noteDataSource(NoteDataSourceRef ref) {
  return _NoteDataSourceImpl('notes');
}

abstract class NoteDataSource {
  NoteDataSource(this.tableName);

  String tableName;
  late final Future<Database> _database = initDatabase(tableName);

  Future<Database> initDatabase(String tableName);

  Future<void> closeDatabase() async {
    final db = await _database;
    return db.close();
  }

  Future<void> insert(Note value) async {
    final db = await _database;
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

  Future<void> delete(Note value) async {
    final db = await _database;
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

  Future<Note?> findNoteById(int? value) async {
    final db = await _database;
    final List<Map<String, Object?>> map =
        await db.query(tableName, where: 'id = $value');
    final firstOfMap = map.elementAtOrNull(0);
    if (firstOfMap != null) {
      return Note.fromMap(firstOfMap);
    } else {
      return null;
    }
  }

  Future<List<Note>?> queryAll() async {
    final db = await _database;
    final List<Map<String, Object?>> map = await db.query(tableName);
    return List.generate(
      map.length,
      (i) => Note.fromMap(map[i]),
    );
  }
}

class _NoteDataSourceImpl extends NoteDataSource {
  _NoteDataSourceImpl(super.tableName);

  @override
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
}
