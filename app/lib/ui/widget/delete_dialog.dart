import 'package:domain/note/remove_note.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/note.dart';

class DeleteDialog extends ConsumerWidget {
  const DeleteDialog({
    super.key,
    required this.deleteTarget,
    this.onCompleteDelete,
  });

  final Note deleteTarget;
  final void Function()? onCompleteDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> removeNote(Note note) async {
      ref.read(removeNoteProvider(note));
    }

    return AlertDialog(
      title: const Text('Delete this note? 😄'),
      actions: [
        TextButton(
          onPressed: () {
            removeNote(deleteTarget).then((_) {
              if (context.mounted) {
                // dismiss dialog
                context.pop();
              }
            }).then((_) {
              onCompleteDelete?.call();
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
  }
}
