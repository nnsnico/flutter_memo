import 'package:flutter_test/flutter_test.dart';
import 'package:model/local_repository.dart';
import 'package:model/note.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:repository/note_repository.dart';
import 'package:domain/note/get_list.dart';

@GenerateNiceMocks([MockSpec<LocalRepository<Note>>()])
import '../mocks/note/get_list_test.mocks.dart';

Future<void> main() async {
  late LocalRepository<Note> repository;

  setUp(() {
    repository = MockLocalRepository();
  });

  test(
      'getNoteList should returned successfully when any notes can be get from NoteRepository',
      () async {
    final testList = List<Note>.from(
      [
        const Note(id: 0, title: 'test title', summary: 'test summary'),
      ],
    );

    when(repository.getAll()).thenAnswer((_) async => testList);

    final container = ProviderContainer(
      overrides: [
        noteRepositoryProvider.overrideWithValue(repository),
      ],
    );
    final expectValue = await container.read(getNoteListProvider.future);

    verify(repository.getAll()).called(1);
    expect(
      expectValue,
      testList,
    );
  });
}
