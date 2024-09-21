import 'package:awesome_notes/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.isInGrid,
    super.key,
  });

  final bool isInGrid ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          color: primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: primary.withOpacity(0.5),
              offset: const Offset(2, 3)),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "This is going to be a title",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: gray900),
          ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: gray100),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  margin: const EdgeInsets.only(right: 4),
                  child: const Text(
                    "First chip",
                    style:
                        TextStyle(fontSize: 12, color: gray700),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          if(isInGrid)
            const Expanded(
              child: Text(
                "Some content",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: gray700),
                ),
              )
          else
            const Text(
                "Some content",
                style: TextStyle(color: gray700),
                ),

          const Row(
            children: [
              Text("09 Aug, 2027", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: gray500),),
              Spacer(),
              FaIcon(FontAwesomeIcons.trash, color: gray500, size: 16,)
            ],
          ),
        ],
      ),
    );
  }
}