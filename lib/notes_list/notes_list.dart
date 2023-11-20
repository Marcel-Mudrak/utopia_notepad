import 'package:utopia_recruitment_task/model/item/item.dart';
import 'package:utopia_recruitment_task/notes_list/note_item.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    required this.notes,
    required this.onRemoveNote,
    super.key,
  });

  final List<Note> notes;
  final void Function(Note note) onRemoveNote;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          notes[index],
        ),
        onDismissed: (direction) {
          onRemoveNote(
            notes[index],
          );
        },
        child: NoteItem(
          notes[index],
        ),
      ),
    );
  }
}
