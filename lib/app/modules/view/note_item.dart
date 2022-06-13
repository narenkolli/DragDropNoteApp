import 'package:drag_drop_flutter/app/data/model/notes.dart';
import 'package:drag_drop_flutter/app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  const NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: note.title ?? "",
              fontWeight: CustomFontWeight.Medium,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: note.endDate ?? "",
              fontWeight: CustomFontWeight.Thin,
            ),
          ],
        ),
      ),
    );
  }
}
