import 'package:flutter/material.dart';
import 'package:flutter_memo/ui/widget/note_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Memo')),
      body: const NoteListView(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'note_button',
        onPressed: () => context.go('/note'),
        tooltip: 'Create a note',
        child: const Icon(Icons.note),
      ),
    );
  }
}
