import 'package:domain/note/get_note.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/note.dart';
import '../widget/delete_dialog.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage(this.noteId, {super.key});

  final int noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(getNoteProvider(noteId));

    return note.when(
      data: (Note? note) {
        return Scaffold(
          appBar: AppBar(
            title: Text(note?.title ?? ''),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  if (note == null) {
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteDialog(
                        deleteTarget: note,
                        onCompleteDelete: () {
                          if (context.mounted) {
                            context.pop();
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: note != null
                ? Column(
                    children: [
                      Text(
                        note.summary,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                : null,
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (_, __) {
        return const Center(child: null);
      },
    );
  }
}
