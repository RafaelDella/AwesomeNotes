import 'package:awesome_notes/Widgets/note_card.dart';
import 'package:flutter/material.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
      itemBuilder: (context, int index) {
        return const NoteCard(isInGrid: true,);
      },
    );
  }
}

