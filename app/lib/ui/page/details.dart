import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:domain/note/get_note.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage(this.noteId, {super.key});

  final int noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(getNoteProvider(noteId)).value;

    return Scaffold(
      appBar: AppBar(title: Text(note?.title ?? 'エラー')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            (note != null)
                ? Text(
                    note.summary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : const Center(child: Text('Internal Error')),
          ],
        ),
      ),
    );
  }
}
