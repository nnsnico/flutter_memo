import 'package:datastore/local_datasource.dart';
import 'package:model/note.dart';
import 'package:repository/repository.dart';

class NoteRepository extends Repository<Note> {
  NoteRepository(this._dataSource);

  final LocalDataSource<Note> _dataSource;

  @override
  Future<void> add(Note value) => _dataSource.insert(value);

  @override
  Future<List<Note>> getAll() async => _dataSource.queryAll().then((value) {
        if (value == null) {
          return [];
        } else {
          return value;
        }
      });

  @override
  Future<void> remove(Note value) => _dataSource.delete(value);
}
