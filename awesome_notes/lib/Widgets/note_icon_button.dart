import 'package:awesome_notes/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteIconButton extends StatelessWidget {
  const NoteIconButton({
      required this.icon,
      required this.size,
      required this.onPressed,
      super.key
    });

  final IconData icon;
  final double? size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
                    onPressed: onPressed,
                    icon: FaIcon(icon),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    constraints: const BoxConstraints(),
                    style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    iconSize: size,
                    color: gray700,
                  );
  }
}