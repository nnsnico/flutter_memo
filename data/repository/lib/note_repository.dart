import 'package:datastore/local_datasource.dart';
import 'package:model/note.dart';
import 'package:repository/repository.dart';

class NoteRepository extends Repository<Note> {

  NoteRepository(this.dataSource);

  final LocalDataSource<Note> dataSource;

  @override
  Future<void> add(Note value) => dataSource.insert(value);

  @override
  Future<List<Note>> getAll() async => dataSource.queryAll().then(
        (value) {
          if (value == null) {
            return [];
          } else {
            return value;
          }
        });

  @override
  Future<void> remove(Note value) => dataSource.delete(value);
}
