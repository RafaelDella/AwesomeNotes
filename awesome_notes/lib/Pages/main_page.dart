import 'package:awesome_notes/Pages/new_or_edit_note_page.dart';
import 'package:awesome_notes/Widgets/note_icon_button_outlined.dart';
import 'package:awesome_notes/Widgets/note_icon_button.dart';
import 'package:awesome_notes/core/constants.dart';
import 'package:awesome_notes/Widgets/note_fab.dart';
import 'package:awesome_notes/Widgets/note_grid.dart';
import 'package:awesome_notes/Widgets/note_list.dart';
import 'package:awesome_notes/Widgets/search_field.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropDownOptions = ['Date modified', 'Date created'];

  late String dropDownValue = dropDownOptions.first;

  bool isDescending = true;
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome Notes 📝"),
        actions: [
          NoteIconButtonOutlined(
            icon: FontAwesomeIcons.rightFromBracket,
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: NoteFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewOrEditNotePage(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  NoteIconButton(
                    icon: isDescending
                        ? FontAwesomeIcons.arrowDown
                        : FontAwesomeIcons.arrowUp,
                    size: 18,
                    onPressed: () {
                      setState(() {
                        isDescending = !isDescending;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  DropdownButton<String>(
                    value: dropDownValue,
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: FaIcon(
                        FontAwesomeIcons.arrowDownWideShort,
                        size: 20,
                        color: gray700,
                      ),
                    ),
                    underline: const SizedBox.shrink(),
                    borderRadius: BorderRadius.circular(16),
                    isDense: true,
                    items: dropDownOptions
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                Text(e),
                                if (e == dropDownValue) ...[
                                  const SizedBox(width: 8),
                                  const Icon(Icons.check),
                                ]
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    selectedItemBuilder: (context) =>
                        dropDownOptions.map((e) => Text(e)).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                  ),
                  const Spacer(),
                  NoteIconButton(
                    icon: isGrid
                        ? FontAwesomeIcons.tableCellsLarge
                        : FontAwesomeIcons.bars,
                    size: 18,
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: isGrid ? const NotesGrid() : const NoteList(),
            ),
          ],
        ),
      ),
    );
  }
}
