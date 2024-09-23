import 'package:awesome_notes/Widgets/note_card.dart';
import 'package:awesome_notes/models/note.dart';
import 'package:flutter/material.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    required this.notes,
    super.key,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
      itemBuilder: (context, int index) {
        return NoteCard(isInGrid: true, note: notes[index],);
      },
    );
  }
}

