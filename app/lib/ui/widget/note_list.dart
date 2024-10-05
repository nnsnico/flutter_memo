import 'package:domain/note/get_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widget/delete_dialog.dart';

class NoteList extends ConsumerWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(getNoteListProvider);

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
                    builder: (context) {
                      return DeleteDialog(
                        deleteTarget: note,
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
