import 'package:awesome_notes/constants.dart';
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
                    side: BorderSide(
                      color: black,
                    ))),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.plus),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Search Notes...",
                  prefixIcon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                  fillColor: white,
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 42, minHeight: 42),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primary),
                  )),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: FaIcon(FontAwesomeIcons.arrowDown)),
                DropdownButton<String>(
                  value: dropDownValue,
                  items: dropDownOptions
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                ),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: FaIcon(FontAwesomeIcons.bars)),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
                itemBuilder: (context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Text("This is going to be a title"),
                        Row(
                          children: [
                            Container(
                              child: Text("First chip"),
                            ),
                          ],
                        ),
                        Text("Content"),
                        Row(
                          children: [
                            Text("09 Aug, 2027"),
                            FaIcon(FontAwesomeIcons.trash)
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
