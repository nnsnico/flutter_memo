import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:domain/note/remove_note.dart';
import 'package:model/note.dart';
import 'package:domain/note/get_list.dart';

class NoteList extends ConsumerWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(getNoteListProvider);

    Future<void> removeNote(Note note) async {
      ref.read(removeNoteProvider(note));
    }

    return noteList.when(
      data: (notes) {
        if (notes.isNotEmpty) {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (cxt) {
                      return AlertDialog(
                        title: const Text('Delete this note?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              removeNote(note).then((_) {
                                if (context.mounted) {
                                  context.pop();
                                }
                              });
                            },
                            child: const Text('OK'),
                          ),
                          TextButton(
                            onPressed: () => context.pop(),
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                onTap: () {
                  context.go('/detail/${note.id}');
                },
                title: Text(note.title),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'ないよ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }
      },
      loading: () => const Center(
        child: Text('LOADING'),
      ),
      error: (error, trace) => const Center(
        child: Text('ERROR'),
      ),
    );
  }
}
