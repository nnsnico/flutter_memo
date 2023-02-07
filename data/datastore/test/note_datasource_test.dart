import 'package:datastore/note_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  late TestDataSource dataSource;
  late Database database;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() async {
    dataSource = TestDataSource();
    database = await dataSource.database;
  });

  tearDown(() async {
    await database.close();
  });

  group('NoteDataSource', () {
    group('`insert`', () {
      test('should succeed', () async {
        const target = Note(id: 1, title: 'test1', summary: 'test1');
        await dataSource.insert(target);

        expect(await database.query(dataSource.tableName), [target.toMap()]);
      });

      test('should throw Exception when attempt to insert duplicated id',
          () async {
        const target = Note(id: 1, title: 'test1', summary: 'test1');
        await dataSource.insert(target);

        expect(
          () async => await dataSource.insert(target),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('`delete`', () {
      test('should succeed', () async {
        const target = Note(id: 1, title: 'test2', summary: 'test2');
        await database.insert(dataSource.tableName, target.toMap());
        await dataSource.delete(target);

        expect(await database.query(dataSource.tableName), []);
      });

      test('should throw Exception when attempt to delete non-exists id',
          () async {
        const target = Note(id: 1, title: 'test2', summary: 'test2');
        await database.insert(dataSource.tableName, target.toMap());
        final nonExistsIdValue = target.copyWith(id: 2);

        expect(
          () async => await dataSource.delete(nonExistsIdValue),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('`queryAll`', () {
      test('should all be equivalent to list after insertion', () async {
        final target = List.of([
          const Note(id: 1, title: 'test1', summary: 'test1 summary'),
          const Note(id: 2, title: 'test2', summary: 'test2 summary'),
          const Note(id: 3, title: 'test3', summary: 'test3 summary'),
        ]);
        for (final note in target) {
          await database.insert(
            dataSource.tableName,
            note.toMap(),
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        }
        final result = await dataSource.queryAll();

        expect(result, target);
      });

      test('should returned empty list when query result is none', () async {
        final result = await dataSource.queryAll();
        expect(result, []);
      });
    });
  });
}

class TestDataSource extends NoteDataSource {
  @override
  Future<Database> initDatabase(String tableName) {
    return openDatabase(
      inMemoryDatabasePath,
      onCreate: (db, version) async {
        return await db.execute(
          'CREATE TABLE $tableName(id INTEGER PRIMARY KEY, title TEXT, summary TEXT)',
        );
      },
      version: 1,
    );
  }
}
