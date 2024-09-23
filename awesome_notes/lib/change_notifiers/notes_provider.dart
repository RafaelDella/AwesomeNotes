import 'package:awesome_notes/models/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesProvider  extends ChangeNotifier
{

  final List<Note> _notes = [];

  List<Note> get notes => [..._notes];


}