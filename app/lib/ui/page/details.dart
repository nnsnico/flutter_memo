import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/note.dart';
import 'package:domain/note/get_list.dart';
import 'package:collection/collection.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage(this.noteId, {super.key});

  final int noteId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: querying note in sqlite
    final noteList = ref.watch(getNoteListProvider);
    final Note? note = noteList.value?.firstWhereOrNull((v) => v.id == noteId);

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
