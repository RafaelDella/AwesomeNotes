import 'package:awesome_notes/Widgets/note_card.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      clipBehavior: Clip.none,
      itemBuilder: (context, index) {
        return const NoteCard(isInGrid: false,);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}

