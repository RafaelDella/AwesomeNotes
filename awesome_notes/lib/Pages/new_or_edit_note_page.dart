import 'package:awesome_notes/Widgets/note_icon_button_outlined.dart';
import 'package:awesome_notes/Widgets/note_icon_button.dart';
import 'package:awesome_notes/core/constants.dart';
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
        title: const Text("New Note"),
        actions: [
          NoteIconButtonOutlined(icon: FontAwesomeIcons.pen, onPressed: () {}),
          NoteIconButtonOutlined(
              icon: FontAwesomeIcons.check, onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Title here", border: InputBorder.none, hintStyle: TextStyle(color: gray300)),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Expanded(flex: 3, child: Text("Last Modified", style: TextStyle(fontWeight: FontWeight.bold, color: gray500),)), 
                Expanded(flex: 5, child: Text("13 December 2023, 14:51 PM", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),))
                ]
              ),
              
            const Row(
              children: [
                Expanded(flex: 3, child: Text("Created", style: TextStyle(fontWeight: FontWeight.bold, color: gray500))), 
                Expanded(flex: 5, child: Text("07 December 2023, 03:35 PM", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
                ]
              ),
              
            Row(
              children: [
                Row(
                  children: [
                    const Text("Created", style: TextStyle(fontWeight: FontWeight.bold, color: gray500)),
                    NoteIconButton(icon: FontAwesomeIcons.circlePlus, size: 18, onPressed: (){})
                  ],
                ),
                const Text("No tags added", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
                ]
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Divider(color: gray500, thickness: 2,),
            ),
            const TextField(decoration: InputDecoration(hintText: "Note here..."),
            ),
          ],
        ),
      ),
    );
  }
}
