import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:datastore/note_datasource.dart';

final class NoteDataSourceImpl extends NoteDataSource {
  NoteDataSourceImpl(super.tableName);

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

