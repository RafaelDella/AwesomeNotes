import 'package:flutter/material.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: /*Image.asset('assets/images/persong.png',),*/[Text("You have no notes yet!\nStart creating by pressing the + button bellow!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Fredoka'),)],),
    );
  }
}