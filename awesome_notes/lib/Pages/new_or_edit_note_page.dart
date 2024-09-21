import 'package:awesome_notes/Widgets/NoteIconButtonOutlined.dart';
import 'package:awesome_notes/Widgets/note_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewOrEditNotePage extends StatefulWidget {
  const NewOrEditNotePage({super.key});

  @override
  State<NewOrEditNotePage> createState() => _NewOrEditNotePageState();
}

class _NewOrEditNotePageState extends State<NewOrEditNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NoteIconButtonOutlined(
            icon: FontAwesomeIcons.chevronLeft, onPressed: () {}),
        title: Text("New Note"),
        actions: [
          NoteIconButtonOutlined(icon: FontAwesomeIcons.pen, onPressed: () {}),
          NoteIconButtonOutlined(
              icon: FontAwesomeIcons.check, onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Title here"),
          ),
          Row(
            children: [
              Text("Last Modified"), 
              Text("13 December 2023, 14:51 PM")
              ]
            ),
            
          Row(
            children: [
              Text("Created"), 
              Text("07 December 2023, 03:35 PM")
              ]
            ),
            
          Row(
            children: [
              Row(
                children: [
                  Text("Created"),
                  NoteIconButton(icon: FontAwesomeIcons.circlePlus, size: 18, onPressed: (){})
                ],
              ),
              Text("No tags added")
              ]
            ),
          Divider(),
          TextField(decoration: InputDecoration(hintText: "Note here..."),
          ),
        ],
      ),
    );
  }
}
