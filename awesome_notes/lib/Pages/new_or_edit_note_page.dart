import 'package:awesome_notes/Widgets/note_icon_button_outlined.dart';
import 'package:awesome_notes/Widgets/note_icon_button.dart';
import 'package:awesome_notes/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewOrEditNotePage extends StatefulWidget {
  const NewOrEditNotePage({
    required this.isNewNote,
    super.key
  });

  final bool isNewNote;

  @override
  State<NewOrEditNotePage> createState() => _NewOrEditNotePageState();
}

class _NewOrEditNotePageState extends State<NewOrEditNotePage> {
  QuillController controller = QuillController.basic();
  late final FocusNode focusNode;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NoteIconButtonOutlined(
            icon: FontAwesomeIcons.chevronLeft, onPressed: () {}),
        title: Text(widget.isNewNote ? "New Note" : 'Edit Note'),
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
            if (!widget.isNewNote)...[
                const Row(
                children: [
                  Expanded(flex: 3, child: Text("Last Modified", style: TextStyle(fontWeight: FontWeight.bold, color: gray500),)), 
                  Expanded(flex: 5, child: Text("13 December 2023, 14:51 PM", style: TextStyle(fontWeight: FontWeight.bold),))
                  ]
                ),
                
              const Row(
                children: [
                  Expanded(flex: 3, child: Text("Created", style: TextStyle(fontWeight: FontWeight.bold, color: gray500))), 
                  Expanded(flex: 5, child: Text("07 December 2023, 03:35 PM", style: TextStyle(fontWeight: FontWeight.bold)))
                  ]
                ),
            ],

            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      const Text("Tags", style: TextStyle(fontWeight: FontWeight.bold, color: gray500)),
                      NoteIconButton(icon: FontAwesomeIcons.circlePlus, size: 18, onPressed: (){})
                    ],
                  ),
                ),
                Expanded(flex: 5,child: const Text("No tags added", style: TextStyle(fontWeight: FontWeight.bold)))
                ]
              ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
            ),
            QuillSimpleToolbar(controller: controller, configurations: const QuillSimpleToolbarConfigurations()),
            Expanded(
              child: QuillEditor.basic(controller: controller ,configurations: const QuillEditorConfigurations()),
              ),
          ],
        ),
      ),
    );
  }
}
