import 'package:awesome_notes/models/note.dart';
import 'package:flutter/material.dart';
import 'note_card.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key, 
    required this.notes
  });
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return NoteCard(isInGrid: false, note: notes[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}