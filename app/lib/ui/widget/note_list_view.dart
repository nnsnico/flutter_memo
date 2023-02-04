import 'package:flutter/material.dart';
import 'package:flutter_memo/notifier/note_list.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoteListView extends ConsumerWidget {
  const NoteListView({key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(noteListProvider);

    return noteList.when(
      data: (notes) {
        if (notes.isNotEmpty) {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final item = notes[index];
              return ListTile(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (cxt) {
                      return AlertDialog(
                        title: const Text('Delete this note?'),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(noteListProvider.notifier)
                                  .removeNote(notes[index]);
                              context.pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                onTap: () {
                  context.go('/detail/${item.id}');
                },
                title: Text(item.title),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'ないよ',
              style: Theme.of(context).textTheme.headline4,
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
