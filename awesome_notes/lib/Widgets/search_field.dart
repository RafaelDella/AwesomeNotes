import 'package:awesome_notes/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search Notes...",
          prefixIcon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          fillColor: white,
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          prefixIconConstraints:
                const BoxConstraints(minWidth: 42, minHeight: 42),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  const BorderSide(color: primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primary),
          )),
    );
  }
}

