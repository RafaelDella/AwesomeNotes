import 'package:awesome_notes/constants.dart';
import 'package:awesome_notes/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 248, 214, 19)),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: background,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(
                  color: primary,
                  fontSize: 32,
                  fontFamily: 'Fredoka',
                  fontWeight: FontWeight.bold),
            ),
      ),
      home: const MainPage(),
    );
  }
}
