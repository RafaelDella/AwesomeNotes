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
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
            style: IconButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: black,
                    ))),
          ),
        ],
      ),
      floatingActionButton: const NoteFab(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isDescending = !isDescending;
                      });
                    },
                    icon: FaIcon(isDescending ? FontAwesomeIcons.arrowDown : FontAwesomeIcons.arrowUp),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(),
                    style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    iconSize: 20,
                    color: gray700,
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
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    icon: FaIcon( 
                      isGrid
                        ? FontAwesomeIcons.tableCellsLarge 
                        : FontAwesomeIcons.bars),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(),
                    style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    iconSize: 20,
                    color: gray700,
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

