import 'package:awesome_notes/change_notifiers/notes_provider.dart';
import 'package:awesome_notes/core/constants.dart';
import 'package:awesome_notes/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awesome Notes',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: primary),
          useMaterial3: true,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: background,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                titleTextStyle: const TextStyle(
                    color: primary,
                    fontSize: 32,
                    fontFamily: 'Fredoka',
                    fontWeight: FontWeight.bold),
              ),
        ),
        home: const MainPage(),
      ),
    );
  }
}
